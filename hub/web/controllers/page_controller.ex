defmodule BitEnvoy.PageController do
  use BitEnvoy.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
