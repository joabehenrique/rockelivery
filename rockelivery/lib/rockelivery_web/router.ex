defmodule RockeliveryWeb.Router do
  use RockeliveryWeb, :router
  alias RockeliveryWeb.Plugs.UUIDChecker

  pipeline :api do
    plug(:accepts, ["json"])
    plug(UUIDChecker)
  end

  pipeline :auth do
    plug(RockeliveryWeb.Auth.Pipeline)
  end

  scope "/api/v1", RockeliveryWeb do
    pipe_through([:api, :auth])

    resources("/user", UserController, except: [:new, :edit, :create])

    post("/item", ItemController, :create)

    post("/order", OrderController, :create)
  end

  scope "/api/v1", RockeliveryWeb do
    pipe_through(:api)

    post("/user", UserController, :create)
    post("/user/signin", UserController, :sign_in)
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through([:fetch_session, :protect_from_forgery])
      live_dashboard("/dashboard", metrics: RockeliveryWeb.Telemetry)
    end
  end
end
