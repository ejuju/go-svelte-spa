package main

import (
	"fmt"
	"net/http"
	"os"
	"strconv"
)

func main() {
	port, err := strconv.Atoi(os.Getenv("PORT"))
	if err != nil {
		panic(fmt.Errorf("invalid port number: %w", err))
	}

	httpHandler := http.FileServer(http.Dir("website/dist"))
	httpServer := &http.Server{
		Addr:    ":" + strconv.Itoa(port),
		Handler: httpHandler,
		// todo: set defaults
	}

	fmt.Printf("starting HTTP server on port %d \n", port)
	err = httpServer.ListenAndServe()
	if err != nil {
		panic(err)
	}
}
