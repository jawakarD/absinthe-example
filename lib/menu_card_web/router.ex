defmodule MenuCardWeb.Router do
  use MenuCardWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", MenuCardWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  forward("/graphiql", Absinthe.Plug.GraphiQL, schema: MenuCardWeb.Schema)

  # Other scopes may use custom stacks.
  # scope "/api", MenuCardWeb do
  #   pipe_through :api
  # end
end
