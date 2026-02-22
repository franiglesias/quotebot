package lib

import (
	"fmt"
	"os"
)

/*
This simulates a production service that you should not call directly from a not-production environment
You are not allowed to touch this file
*/

// Publish publishes a quote proposal (exits on production call!)
func Publish(proposal float64) {
	fmt.Println("You've pushed a dummy auction to a real ads platform, the business is upset!")
	os.Exit(-1)
}
