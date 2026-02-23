defmodule Quotebot.TechBlogs do
  @moduledoc """
  This simulates a very slow database connection.

  You are not supposed to touch this file.
  """

  def list_all_blogs do
    # Very slow database access
    Process.sleep(5000)

    [
      "HackerNews",
      "Reddit",
      "TechCrunch",
      "BuzzFeed",
      "TheHuffPost",
      "TMZ",
      "GigaOM"
    ]
  end
end
