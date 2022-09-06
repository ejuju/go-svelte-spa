package fsutil

import (
	"io"
	"io/ioutil"
	"log"
	"os"
)

// Returns true if directory is empty
func IsEmpty(name string) bool {
	f, err := os.Open(name)
	if err != nil {
		return false
	}
	defer f.Close()

	_, err = f.Readdirnames(1) // Or f.Readdir(1)
	return err == io.EOF
}

//
func WriteFileNames(w io.Writer, dirpath string) error {
	files, err := ioutil.ReadDir(dirpath)
	if err != nil {
		log.Fatal(err)
	}

	for _, file := range files {
		_, err = w.Write([]byte(file.Name() + "\n"))
		if err != nil {
			return err
		}
	}

	return nil
}
