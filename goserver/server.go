package main

import (
	"fmt"
	"net/http"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	router.GET("/go", func(c *gin.Context) {
		startTime := time.Now()

		// Simulate heavy processing
		sum := 0
		for i := 0; i < 1000000; i++ {
			sum = sum + 1
		}

		endTime := time.Now()
		processingTime := endTime.Sub(startTime)

		fmt.Println("total value :", sum)

		c.JSON(http.StatusOK, gin.H{
			"message":        "hello from Go server",
			"processingTime": processingTime.String(),
		})
	})

	const port = 8080
	address := ":" + strconv.Itoa(port)

	router.Run(address)
}
