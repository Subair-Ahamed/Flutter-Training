package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"regexp"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

// User struct represents a user entity
type User struct {
	Username string `json:"username"`
	Email    string `json:"email"`
	Password string `json:"password"`
}

// MySQL connection
var db *sql.DB

func initDB() {
	var err error
	db, err = sql.Open("mysql", "root:123@tcp(localhost:3306)/userdata")
	if err != nil {
		log.Fatal(err)
	}

	err = db.Ping()
	if err != nil {
		log.Fatal(err)
	}
}

func main() {
	initDB()
	defer db.Close()

	r := mux.NewRouter()

	// Routes
	r.HandleFunc("/login", login)
	r.HandleFunc("/register", register)
	r.HandleFunc("/dashboard", dashboardHandler).Methods("GET")
	err := http.ListenAndServe(":8080", corsHandler(r))
	if err != nil {
		log.Fatal("Server error: ", err)
	}
	log.Print("Server listening on http://localhost:8080")
}

func login(w http.ResponseWriter, r *http.Request) {
	// Parse request body
	var user User
	err := json.NewDecoder(r.Body).Decode(&user)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Query the database to retrieve the user's information
	var storedUser User
	err = db.QueryRow("SELECT username, email, password FROM users WHERE email = ?", user.Email).Scan(&storedUser.Username, &storedUser.Email, &storedUser.Password)

	if err != nil {
		http.Error(w, "Invalid credentials", http.StatusUnauthorized)
		return
	}

    w.Header().Set("Username", user.Username)
    w.Header().Set("Email", user.Email)

	// Print the values for debugging
	fmt.Println("Stored Password:", storedUser.Password)
	fmt.Println("Provided Password:", user.Password)

	// Compare the password provided in the request with the stored password
	if storedUser.Password != user.Password {
		http.Error(w, "Invalid credentials", http.StatusUnauthorized)
		return
	}

	// If the passwords match, authentication is successful
	// You can add additional logic here, such as generating a JWT token for authentication
	fmt.Fprintf(w, "Login successful!")
	http.Redirect(w, r, "/dashboard", http.StatusSeeOther)
}

func register(w http.ResponseWriter, r *http.Request) {
	// Parse request body
	var user User
	err := json.NewDecoder(r.Body).Decode(&user)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Validate email format
	if !isValidEmail(user.Email) {
		http.Error(w, "Invalid email format", http.StatusBadRequest)
		return
	}

	// Check if user already exists
	var count int
	err = db.QueryRow("SELECT COUNT(*) FROM users WHERE username = ? OR email = ?", user.Username, user.Email).Scan(&count)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	if count > 0 {
		http.Error(w, "User already exists", http.StatusBadRequest)
		return
	}

	// Insert user into the database
	_, err = db.Exec("INSERT INTO users (username, email, password) VALUES (?, ?, ?)", user.Username, user.Email, user.Password)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// Registration successful
	fmt.Fprintf(w, "Registration successful!")
	http.Redirect(w, r, "/dashboard", http.StatusSeeOther)
}

func corsHandler(handler http.Handler) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With")

		if r.Method == "OPTIONS" {
			// Preflight request
			w.WriteHeader(http.StatusOK)
			return
		}

		handler.ServeHTTP(w, r)
	}
}

// User
func dashboardHandler(w http.ResponseWriter, r *http.Request) {
	// Extract username from request headers or session
    username := r.Header.Get("Username")
    email := r.Header.Get("Email")

	if username == "" {
		http.Error(w, "Unauthorized", http.StatusUnauthorized)
		return
	}
	// Display dashboard
	fmt.Fprintf(w, "Welcome, %s! Your email is %s.", username, email)
}

func isValidEmail(email string) bool {
	// Regular expression for email validation
	emailRegex := `^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`
	return regexp.MustCompile(emailRegex).MatchString(email)
}
