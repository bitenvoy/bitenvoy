defmodule BitEnvoyHub.EventView do
  use BitEnvoyHub.Web, :view

  def render("index.json", %{events: events}) do
    %{data: render_many(events, BitEnvoyHub.EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, BitEnvoyHub.EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      name: event.name,
      output: event.output,
      state: event.state,
      started: event.started,
      completed: event.completed}
  end
end
