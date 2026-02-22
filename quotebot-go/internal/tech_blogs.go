package internal

import "time"

/*
This simulates a very slow database connection

You are not supposed to touch this file
*/

// ListAllBlogs returns all tech blogs (very slow)
func ListAllBlogs() []string {
	time.Sleep(5 * time.Second)

	return []string{
		"HackerNews",
		"Reddit",
		"TechCrunch",
		"BuzzFeed",
		"TheHuffPost",
		"TMZ",
		"GigaOM",
	}
}
