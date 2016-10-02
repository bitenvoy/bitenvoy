defmodule BitEnvoyHub.EventTest do
  use BitEnvoyHub.ModelCase

  alias BitEnvoyHub.Event

  @valid_attrs %{completed: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, name: "some content", output: "some content", started: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, state: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
