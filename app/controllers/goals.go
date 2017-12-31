package controllers

import (
	"github.com/revel/revel"
	"github.com/rpaul80/goals/app"
	"github.com/rpaul80/goals/app/models"
)

type Goals struct {
	*revel.Controller
}

// Shows a single Goal record including any activity on it
func (c Goals) Show(circle_id string, goal_id string) revel.Result {
	goalStmt, err := app.DB.Prepare("select goals.id, goals.title, goals.description, goals.created, goals.updated, users.id, users.first_name, users.last_name from goals inner join users on goals.user_id=users.id where goals.id=$1")
	if err != nil {
		revel.AppLog.Error(err.Error())
		return c.RenderError(err)
	}

	goalRow := goalStmt.QueryRow(goal_id)
	g := models.Goal{}
	err = goalRow.Scan(&g.Id, &g.Title, &g.Description, &g.Created, &g.Updated, &g.User.Id, &g.User.FirstName, &g.User.LastName)
	if err != nil {
		revel.AppLog.Error(err.Error())
	}

	cStmt, err := app.DB.Prepare(
		"select comments.id, comments.user_id, comments.body, comments.created, users.id, users.first_name, users.last_name from comments inner join users on comments.user_id=users.id where comments.goal_id=$1")
	rows, err := cStmt.Query(goal_id)
	if err != nil {
		revel.AppLog.Panic(err.Error())
	}
	defer rows.Close()

	var comments []models.Comment
	comment := models.Comment{}
	for rows.Next() {
		err := rows.Scan(
			&comment.Id, &comment.UserId, &comment.Body, &comment.Created,
			&comment.User.Id, &comment.User.FirstName, &comment.User.LastName)
		if err != nil {
			revel.AppLog.Error(err.Error())
		}
		comments = append(comments, comment)
	}

	err = rows.Err()
	if err != nil {
		revel.AppLog.Error(err.Error())
	}
	g.Comments = comments
	return c.Render(g)
}
