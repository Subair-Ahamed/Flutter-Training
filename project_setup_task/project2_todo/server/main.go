package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
	_ "github.com/go-sql-driver/mysql"
)

// Task struct to represent a task
type Task struct {
	ID    int    `json:"id"`
	Title string `json:"title"`
	Done  bool   `json:"done"`
}

var db *sql.DB

func main() {
	// Connect to MySQL database
	var err error
	db, err = sql.Open("mysql", "root:123@tcp(127.0.0.1:3306)/todoapp")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	// Initialize router
	router := mux.NewRouter()

	// Define routes
	router.HandleFunc("/tasks", getTasks).Methods("GET")
	router.HandleFunc("/tasks", createTask).Methods("POST")
	router.HandleFunc("/tasks/{id}", updateTask).Methods("PUT")
	router.HandleFunc("/tasks/{id}", deleteTask).Methods("DELETE")

	// Enable CORS
	corsHandler := func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			w.Header().Set("Access-Control-Allow-Origin", "*")
			w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
			w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With")
			if r.Method == "OPTIONS" {
				w.WriteHeader(http.StatusOK)
				return
			}
			next.ServeHTTP(w, r)
		})
	}

	// Use CORS middleware
	http.ListenAndServe(":8090", corsHandler(router))
}

// Get all tasks
func getTasks(w http.ResponseWriter, r *http.Request) {
	var tasks []Task
	rows, err := db.Query("SELECT id, title, done FROM tasks")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	for rows.Next() {
		var task Task
		err := rows.Scan(&task.ID, &task.Title, &task.Done)
		if err != nil {
			log.Fatal(err)
		}
		tasks = append(tasks, task)
	}
	json.NewEncoder(w).Encode(tasks)
}

// Create a new task
func createTask(w http.ResponseWriter, r *http.Request) {
	var task Task
	json.NewDecoder(r.Body).Decode(&task)
	_, err := db.Exec("INSERT INTO tasks (title, done) VALUES (?, ?)", task.Title, task.Done)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Fprintf(w, "Task created successfully")
}

// Update a task
func updateTask(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	_, err := db.Exec("UPDATE tasks SET done = ? WHERE id = ?", true, params["id"])
	if err != nil {
		log.Fatal(err)
	}
	fmt.Fprintf(w, "Task updated successfully")
}

// Delete a task
func deleteTask(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	_, err := db.Exec("DELETE FROM tasks WHERE id = ?", params["id"])
	if err != nil {
		log.Fatal(err)
	}
	fmt.Fprintf(w, "Task deleted successfully")
}
