package lib

import (
	"errors"
	"math/rand"
	"os"
)

/*
This simulates that a license is required for running this 3rd party library
You are not allowed to touch this file
*/

// MarketStudyVendor provides market data (requires license)
type MarketStudyVendor struct{}

// NewMarketStudyVendor creates a new MarketStudyVendor instance
func NewMarketStudyVendor() *MarketStudyVendor {
	return &MarketStudyVendor{}
}

// AveragePrice returns the average price for a blog
func (m *MarketStudyVendor) AveragePrice(blog string) float64 {
	if os.Getenv("LICENSE") != "quotebot-license" {
		panic(errors.New("[Stupid license] Missing license!!!!"))
	}

	return float64(rand.Intn(100000))
}
