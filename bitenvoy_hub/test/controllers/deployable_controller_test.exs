defmodule BitEnvoyHub.DeployableControllerTest do
  use BitEnvoyHub.ConnCase

  alias BitEnvoyHub.Deployable
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, deployable_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    deployable = Repo.insert! %Deployable{}
    conn = get conn, deployable_path(conn, :show, deployable)
    assert json_response(conn, 200)["data"] == %{"id" => deployable.id,
      "name" => deployable.name}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, deployable_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, deployable_path(conn, :create), deployable: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Deployable, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, deployable_path(conn, :create), deployable: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    deployable = Repo.insert! %Deployable{}
    conn = put conn, deployable_path(conn, :update, deployable), deployable: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Deployable, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    deployable = Repo.insert! %Deployable{}
    conn = put conn, deployable_path(conn, :update, deployable), deployable: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    deployable = Repo.insert! %Deployable{}
    conn = delete conn, deployable_path(conn, :delete, deployable)
    assert response(conn, 204)
    refute Repo.get(Deployable, deployable.id)
  end
end
