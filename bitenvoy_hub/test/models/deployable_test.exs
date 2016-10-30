defmodule BitEnvoyHub.DeployableTest do
  use BitEnvoyHub.ModelCase

  alias BitEnvoyHub.Deployable

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Deployable.changeset(%Deployable{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Deployable.changeset(%Deployable{}, @invalid_attrs)
    refute changeset.valid?
  end
end
