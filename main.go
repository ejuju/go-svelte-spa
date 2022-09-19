package main

import (
	"fmt"
	"net/http"
	"os"
	"strconv"
	"strings"

	"github.com/ejuju/go-svelte-spa/pkg/httputils"
	"github.com/gorilla/mux"
)

type HTTPRouter struct {
	WebsiteHTTPHandler http.Handler
	BackendHTTPHandler http.Handler
}

// This function routes requests to the appropriate handler
// depending if they are for the backend API or the file server (= website files).
func (httpRouter *HTTPRouter) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	fmt.Println("New request on endpoint: ", r.URL.Path) // debug
	if !strings.HasPrefix(r.URL.Path, "/api/") {
		httpRouter.WebsiteHTTPHandler.ServeHTTP(w, r)
		return
	}

	httpRouter.BackendHTTPHandler.ServeHTTP(w, r)
}

func main() {
	port, err := strconv.Atoi(os.Getenv("PORT"))
	if err != nil {
		panic(fmt.Errorf("invalid port number: %w", err))
	}

	httpWebsiteHandler := http.FileServer(http.Dir("website/dist"))

	// init backend api
	httpBackendHandler := mux.NewRouter()
	httpBackendHandler.HandleFunc("/api/v1/", httputils.NotImplementedHandlerFunc)

	// init higher level http router
	httpHandler := &HTTPRouter{
		WebsiteHTTPHandler: httpWebsiteHandler,
		BackendHTTPHandler: httpBackendHandler,
	}

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
