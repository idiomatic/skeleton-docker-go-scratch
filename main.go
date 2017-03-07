package main

import (
	"log"
	"net/http"
)

func init() {
	http.Handle("/", http.FileServer(http.Dir("static")))
}

func main() {
	log.Fatal(http.ListenAndServe(":80", nil))
}
