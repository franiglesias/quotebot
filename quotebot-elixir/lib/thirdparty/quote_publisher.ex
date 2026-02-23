defmodule Quotebot.Thirdparty.QuotePublisher do
  @moduledoc """
  This simulates a production service that you should not call directly
  from a not-production environment.

  You are not allowed to touch this file.
  """

  def publish(proposal) do
    IO.puts("You've pushed a dummy auction to a real ads platform, the business is upset!")
    IO.puts("Proposal: #{proposal}")
    System.halt(1)
  end
end
