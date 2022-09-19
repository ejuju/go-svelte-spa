package httputils

import (
	"net/http"
	"os"
)

func NotImplementedHandlerFunc(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Not implemented yet."))
}

type FileServer struct {
	config FileServerConfig
}

type FileServerConfig struct {
	Files map[string]os.File
}

func NewFileServer() *FileServer {

	return &FileServer{}
}

func (f *FileServer) ServeHTTP(w http.ResponseWriter, r *http.Request) {

}
