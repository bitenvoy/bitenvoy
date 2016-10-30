defmodule BitEnvoyHub.DeployableController do
  use BitEnvoyHub.Web, :controller

  alias BitEnvoyHub.Deployable

  def index(conn, _params) do
    deployables = Repo.all(Deployable)
    render(conn, "index.json", deployables: deployables)
  end

  def create(conn, %{"deployable" => deployable_params}) do
    changeset = Deployable.changeset(%Deployable{}, deployable_params)

    case Repo.insert(changeset) do
      {:ok, deployable} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", deployable_path(conn, :show, deployable))
        |> render("show.json", deployable: deployable)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BitEnvoyHub.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    deployable = Repo.get!(Deployable, id)
    render(conn, "show.json", deployable: deployable)
  end

  def update(conn, %{"id" => id, "deployable" => deployable_params}) do
    deployable = Repo.get!(Deployable, id)
    changeset = Deployable.changeset(deployable, deployable_params)

    case Repo.update(changeset) do
      {:ok, deployable} ->
        render(conn, "show.json", deployable: deployable)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BitEnvoyHub.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    deployable = Repo.get!(Deployable, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(deployable)

    send_resp(conn, :no_content, "")
  end
end
