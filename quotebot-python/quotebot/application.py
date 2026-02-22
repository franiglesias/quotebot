from quotebot.automatic_quote_bot import AutomaticQuoteBot


def main():
    bot = AutomaticQuoteBot()
    bot.send_all_quotes("FAST")


if __name__ == "__main__":
    main()
