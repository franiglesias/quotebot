package internal

var cache []string

// GetAdSpaces returns all ad spaces (with static cache)
func GetAdSpaces() []string {
	if len(cache) > 0 {
		return cache
	}

	// FIXME: only return blogs that start with a 'T'

	cache = ListAllBlogs()
	return cache
}
