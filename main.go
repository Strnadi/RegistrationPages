package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		path := r.URL.Path

		if path == "/" {
			http.ServeFile(w, r, "src/index.html")
			return
		}
		if path == "/forgotten-password" {
			http.ServeFile(w, r, "src/forgotten-password.html")
			return
		}

		// Map route like "/forgotten-password" → "src/forgotten-password.html"
		filePath := "src" + path + ".html"
		if _, err := os.Stat(filePath); err == nil {
			http.ServeFile(w, r, filePath)
			return
		}

		// Fallback to 404
		http.ServeFile(w, r, "src/404.html")
	})

	log.Println("Listening on :3000")
	log.Fatal(http.ListenAndServe(":3000", nil))
}

