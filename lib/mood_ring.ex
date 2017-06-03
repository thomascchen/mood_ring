defmodule MoodRing do
  @moduledoc """
  Documentation for MoodRing.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MoodRing.hello
      :world

  """
  def hello do
    :world
  end

  use Application
  require Logger

  def start(_type, args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, MoodRing.Plug, [], port: 8080)
    ]

    Logger.info "Started application"

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
