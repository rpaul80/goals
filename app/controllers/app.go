package controllers

import (
	"github.com/revel/revel"
	"github.com/rpaul80/goals/app"
	"github.com/rpaul80/goals/app/models"
)

type App struct {
	*revel.Controller
}

func (c App) Index() revel.Result {
	stmt := `select goals.id, goals.title, goals.description, goals.created, goals.updated, users.id, users.first_name, users.last_name
		FROM goals inner join users on goals.user_id=users.id order by goals.created desc`
	rows, err := app.DB.Query(stmt)
	defer rows.Close()
	if err != nil {
		revel.AppLog.Error("Error executing query")
		return c.RenderError(err)
	}

	var goals []models.Goal
	g := models.Goal{}
	for rows.Next() {
		err := rows.Scan(&g.Id, &g.Title, &g.Description, &g.Created, &g.Updated, &g.User.Id, &g.User.FirstName, &g.User.LastName)
		if err != nil {
			revel.AppLog.Error(err.Error())
		}
		goals = append(goals, g)
	}

	err = rows.Err()
	if err != nil {
		revel.AppLog.Error(err.Error())
	}

	return c.RenderJSON(goals)
}
