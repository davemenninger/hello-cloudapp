defmodule HelloCloudappWeb.PageController do
  use HelloCloudappWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
