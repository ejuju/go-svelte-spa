package main

import (
	"net/http"
)

func main() {
	httpHandler := http.FileServer(http.Dir("website_static_build"))

	httpServer := &http.Server{
		Addr:    ":8080",
		Handler: httpHandler,
		// todo: set defaults
	}

	err := httpServer.ListenAndServe()
	if err != nil {
		panic(err)
	}
}
