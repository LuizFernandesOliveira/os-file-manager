IMAGE_NAME=os-file-manager

fmt:
	go fmt ./...

mock:
	go generate -v ./...

test: mock
	go test ./... --coverprofile coverage.out

cover:
	go tool cover -html coverage.out

run:
	go run main.go

doc:
	swag init --pd --ot=json

build: doc
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -buildvcs=false -ldflags="-w -s" -o application

build-image: build
	docker build . -t ${IMAGE_NAME}

update-module:
	go mod tidy

init:
	go mod tidy
	cp example.env .env

install-go:
	sudo snap install go --channel=1.21/stable --classic

install: install-go
	go install github.com/swaggo/swag/cmd/swag@latest
	go install go.uber.org/mock/mockgen@latest
	echo 'export GOPATH="$$HOME/go"' >>~/.profile
	echo 'export PATH="$$PATH:$$GOPATH/bin"' >>~/.profile
	echo 'export PATH="$$PATH:$$GOPATH/bin:/usr/local/go/bin"' >>~/.profile
	. ~/.profile
