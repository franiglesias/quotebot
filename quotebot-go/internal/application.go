package internal

// Run is the static main entry point
func Run() {
	bot := NewAutomaticQuoteBot()
	bot.SendAllQuotes("FAST")
}
