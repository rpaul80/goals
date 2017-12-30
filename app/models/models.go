package models

import (
	"fmt"
	"time"
)

// Goal is the goal model
type Goal struct {
	Id          string    `json:"id"`
	Title       string    `json:"title"`
	Description string    `json:"description"`
	Created     time.Time `json:"created"`
	Updated     time.Time `json:"updated"`
	User        User      `json:"user"`
	Comments    []Comment `json:"comments"`
}

// A User is a user :)
type User struct {
	Id        string `json:"id"`
	Email     string `json:"email, omitempty"`
	FirstName string `json:"first_name, omitempty"`
	LastName  string `json:"last_name, omitempty"`
}

// A Circle is a group to share goals with
type Circle struct {
	Id          string    `json:"id"`
	Title       string    `json:"title, omitempty"`
	Description string    `json:"description, omitempty"`
	Created     time.Time `json:"created"`
	Updated     time.Time `json:"updated"`
	Members     []User    `json:"members"`
	Goals       []Goal    `json:"goals"`
}

// A Comment is a comment on a Goal
type Comment struct {
	Id      string    `json:"id"`
	UserId  string    `json:"user_id"`
	Body    string    `json:"body, omitempty"`
	Created time.Time `json:"created"`
	Updated time.Time `json:"updated"`
	User    User      `json:"user"`
}

// Name returns the full name of the user
func (u *User) Name() string {
	return fmt.Sprintf("%s %s", u.FirstName, u.LastName)
}
