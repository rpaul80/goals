package controllers

import (
	"github.com/revel/revel"
	"github.com/rpaul80/goals/app"
	"github.com/rpaul80/goals/app/models"
)

type Circles struct {
	*revel.Controller
}

func (c Circles) Show(id string) revel.Result {
	circleStmt, err := app.DB.Prepare("select circles.id, circles.title, circles.description, circles.created, circles.updated from circles where circles.id=$1")
	if err != nil {
		revel.AppLog.Error(err.Error())
		return c.RenderError(err)
	}
	circleRow := circleStmt.QueryRow(id)
	circle := models.Circle{}
	err = circleRow.Scan(&circle.Id, &circle.Title, &circle.Description, &circle.Created, &circle.Updated)
	if err != nil {
		revel.AppLog.Error(err.Error())
	}

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

	return c.Render(circle, goals)
}
