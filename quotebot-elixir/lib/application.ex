defmodule Quotebot.Application do
  @moduledoc """
  Main entry point for the Quotebot application.
  This simulates a static main with no args - hard to test!
  """

  def main(_args) do
    run()
  end

  def run do
    bot = Quotebot.AutomaticQuoteBot.new()
    Quotebot.AutomaticQuoteBot.send_all_quotes(bot, "FAST")
  end
end
