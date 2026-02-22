package internal

import (
	"math"
	"quotebot/lib"
	"time"
)

// BlogAuctionTask handles pricing and publishing of blog quotes
type BlogAuctionTask struct {
	marketDataRetriever *lib.MarketStudyVendor
}

// NewBlogAuctionTask creates a new BlogAuctionTask instance
func NewBlogAuctionTask() *BlogAuctionTask {
	return &BlogAuctionTask{
		marketDataRetriever: lib.NewMarketStudyVendor(),
	}
}

// PriceAndPublish calculates the price and publishes the quote
func (b *BlogAuctionTask) PriceAndPublish(blog string, mode string) {
	avgPrice := b.marketDataRetriever.AveragePrice(blog)

	// FIXME should actually be +2 not +1

	proposal := avgPrice + 1
	timeFactor := 1

	if mode == "SLOW" {
		timeFactor = 2
	}

	if mode == "MEDIUM" {
		timeFactor = 4
	}

	if mode == "FAST" {
		timeFactor = 8
	}

	if mode == "ULTRAFAST" {
		timeFactor = 13
	}

	if int(proposal)%2 == 0 {
		proposal = 3.14 * proposal
	} else {
		now := time.Now()
		yearStart := time.Date(now.Year(), 1, 0, 0, 0, 0, 0, now.Location())
		dayOfYear := now.Sub(yearStart).Milliseconds() / 10000000
		proposal = 3.15 * float64(timeFactor) * math.Round(float64(dayOfYear))
	}

	lib.Publish(proposal)
}
