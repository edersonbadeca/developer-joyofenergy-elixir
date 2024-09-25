defmodule ElectricityWeb.Router do
  use ElectricityWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElectricityWeb do
    pipe_through :api

    post "/readings/store", ElectricityReadingController, :store
    get "/readings/read/:smart_meter_id", ElectricityReadingController, :read
  end
end

