defmodule Quotebot.AdSpace do
  @moduledoc """
  AdSpace module with static cache.
  Stateful behavior: first call different from next calls.
  """

  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def get_ad_spaces do
    # Try to use Agent if started, otherwise use process dictionary
    cache =
      case Process.whereis(__MODULE__) do
        nil -> Process.get(:ad_space_cache, [])
        _pid -> Agent.get(__MODULE__, & &1)
      end

    if cache != [] do
      cache
    else
      # FIXME: only return blogs that start with a 'T'
      blogs = Quotebot.TechBlogs.list_all_blogs()

      # Store in cache
      case Process.whereis(__MODULE__) do
        nil -> Process.put(:ad_space_cache, blogs)
        _pid -> Agent.update(__MODULE__, fn _ -> blogs end)
      end

      blogs
    end
  end

  def clear_cache do
    case Process.whereis(__MODULE__) do
      nil -> Process.put(:ad_space_cache, [])
      _pid -> Agent.update(__MODULE__, fn _ -> [] end)
    end
  end
end
