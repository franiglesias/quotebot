defmodule Quotebot.AutomaticQuoteBot do
  @moduledoc """
  AutomaticQuoteBot sends quotes to all ad spaces.
  Hard-coded dependencies make this difficult to test.
  """

  defstruct []

  def new do
    %__MODULE__{}
  end

  def send_all_quotes(_bot, mode) do
    blogs = Quotebot.AdSpace.get_ad_spaces()

    Enum.each(blogs, fn blog ->
      auction_task = Quotebot.BlogAuctionTask.new()
      Quotebot.BlogAuctionTask.price_and_publish(auction_task, blog, mode)
    end)
  end
end
