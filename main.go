package main

import (
	"github.com/LuizFernandesOliveira/os-file-manager/src/application/controllers"
	"github.com/colibri-project-io/colibri-sdk-go"
	"github.com/colibri-project-io/colibri-sdk-go/pkg/web/restserver"
)

func init() {
	colibri.InitializeApp()
	//storage.Initialize() // uncomment if you use storage
	//cacheDB.Initialize() // uncomment if you use cache
	//sqlDB.Initialize() // uncomment if you use sql database
	//messaging.Initialize() // uncomment if you use messaging
	// os-file-manager
}

func main() {
	restserver.AddRoutes(controllers.NewDemoController().Routes())
	restserver.ListenAndServe()
}
