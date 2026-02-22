package internal

// AutomaticQuoteBot sends quotes to all ad spaces
type AutomaticQuoteBot struct{}

// NewAutomaticQuoteBot creates a new AutomaticQuoteBot instance
func NewAutomaticQuoteBot() *AutomaticQuoteBot {
	return &AutomaticQuoteBot{}
}

// SendAllQuotes sends quotes to all blogs
func (a *AutomaticQuoteBot) SendAllQuotes(mode string) {
	blogs := GetAdSpaces()
	for _, blog := range blogs {
		auctionTask := NewBlogAuctionTask()
		auctionTask.PriceAndPublish(blog, mode)
	}
}
