defmodule BitEnvoyHub.DeployableView do
  use BitEnvoyHub.Web, :view

  def render("index.json", %{deployables: deployables}) do
    %{data: render_many(deployables, BitEnvoyHub.DeployableView, "deployable.json")}
  end

  def render("show.json", %{deployable: deployable}) do
    %{data: render_one(deployable, BitEnvoyHub.DeployableView, "deployable.json")}
  end

  def render("deployable.json", %{deployable: deployable}) do
    %{id: deployable.id,
      name: deployable.name}
  end
end
