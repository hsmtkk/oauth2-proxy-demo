package main

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	// Echo instance
	e := echo.New()

	// Middleware
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	// Routes
	e.GET("/*", defaultHandler)

	// Start server
	e.Logger.Fatal(e.Start(":8080"))
}

// Handler
func defaultHandler(ctx echo.Context) error {
	js, err := json.MarshalIndent(ctx.Request().Header, "", " ")
	if err != nil {
		return fmt.Errorf("failed to marshal as JSON; %w", err)
	}
	return ctx.String(http.StatusOK, string(js))
}
