defmodule Quotebot.Thirdparty.MarketStudyVendor do
  @moduledoc """
  This simulates that a license is required for running this 3rd party library.

  You are not allowed to touch this file.
  """

  defstruct []

  def new do
    %__MODULE__{}
  end

  def average_price(_vendor, _blog) do
    case System.get_env("LICENSE") do
      "quotebot-license" ->
        # Random price (non-deterministic!)
        :rand.uniform(100_000) * 1.0

      _ ->
        raise "[Stupid license] Missing license!!!!"
    end
  end
end
