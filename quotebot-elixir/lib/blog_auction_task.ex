defmodule Quotebot.BlogAuctionTask do
  @moduledoc """
  BlogAuctionTask handles pricing and publishing of blog quotes.
  Uses hard-coded dependencies and time-based calculations.
  """

  defstruct [:market_data_retriever]

  def new do
    %__MODULE__{
      market_data_retriever: Quotebot.Thirdparty.MarketStudyVendor.new()
    }
  end

  def price_and_publish(task, blog, mode) do
    avg_price = Quotebot.Thirdparty.MarketStudyVendor.average_price(task.market_data_retriever, blog)

    # FIXME should actually be +2 not +1
    proposal = avg_price + 1

    time_factor =
      case mode do
        "SLOW" -> 2
        "MEDIUM" -> 4
        "FAST" -> 8
        "ULTRAFAST" -> 13
        _ -> 1
      end

    proposal =
      if rem(trunc(proposal), 2) == 0 do
        3.14 * proposal
      else
        now = DateTime.utc_now()
        day_of_year = Date.day_of_year(now)
        3.15 * time_factor * Float.round(day_of_year / 1.0)
      end

    Quotebot.Thirdparty.QuotePublisher.publish(proposal)
  end
end
