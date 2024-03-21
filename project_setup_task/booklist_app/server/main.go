package main

import (
	"encoding/json"
	"net/http"
)

type Book struct {
	Title       string `json:"title"`
	Author      string `json:"author"`
	Description string `json:"description"`
	ImageURL    string `json:"image_url"`
}

var books = []Book{
	{
		Title:       "Java",
		Author:      "James Gosling",
		Description: "Java is a widely-used programming language for coding web applications. It has been a popular choice among developers for over two decades, with millions of Java applications in use today. Java is a multi-platform, object-oriented, and network-centric language that can be used as a platform in itself.You can use Java to build applications for almost any platform, including desktop, mobile, and web. It is also widely used in developing enterprise-level applications, such as financial and trading systems, e-commerce platforms, and healthcare systems.",
	},
	{
		Title:       "Python",
		Author:      "Guido van Rossum",
		Description: "Python supports modules and packages, which encourages program modularity and code reuse. The Python interpreter and the extensive standard library are available in source or binary form without charge for all major platforms, and can be freely distributed.Python is extensively applied in data science, data analysis, machine learning, data engineering, web development, software development, and other fields.",
	},
	{
		Title:       "Golang",
		Author:      "Rob Pike, Ken Thomson, and Robert Griesemer",
		Description: "Go was originally built for programs related to networking and infrastructure. It was intended to replace popular high-performance server-side languages like Java and C++. Today, Go is used for a variety of applications like cloud and server side applications, DevOps, command line tools and much more.",
	},
	{
		Title:       "C++",
		Author:      "Bjarne Stroustrup",
		Description: "C++ is a generic programming language for building software. It's an object-oriented language. In other words, it emphasizes using data fields with unique attributes (a.k.a. objects) rather than logic or functions. A common example of an object is a user account on a website.C++ is used in fields such as system software, game development, embedded systems, scientific computing and high-performance applications.",
	},
	{
		Title:       "Javascript",
		Author:      "Brendan Eich",
		Description: "JavaScript (JS) is a computer programming language used to make websites and applications dynamic and interactive. It's unique because it can run directly in your browser, not just on a server.Search engines, ecommerce, content management systems, responsive design, social media and phone apps would not be possible without it",
	},
}

func main() {
	http.HandleFunc("/books", func(w http.ResponseWriter, r *http.Request) {
		// Set CORS headers
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "GET, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With")

		// Respond to preflight requests
		if r.Method == http.MethodOptions {
			return
		}

		// Set content type
		w.Header().Set("Content-Type", "application/json")

		// Encode books to JSON and write response
		json.NewEncoder(w).Encode(books)
	})

	http.ListenAndServe(":8082", nil)
}
