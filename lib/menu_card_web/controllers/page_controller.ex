defmodule MenuCardWeb.PageController do
  use MenuCardWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
