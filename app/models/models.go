package models

import "time"

// Goal is the goal model
type Goal struct {
	Id          string    `json:"id"`
	Title       string    `json:"title"`
	Description string    `json:"description"`
	Created     time.Time `json:"created"`
	Updated     time.Time `json:"updated"`
	User        User      `json:"user"`
}

type User struct {
	Id        string `json:"id"`
	Email     string `json:"email, omitempty"`
	FirstName string `json:"first_name, omitempty"`
	LastName  string `json:"last_name, omitempty"`
}
