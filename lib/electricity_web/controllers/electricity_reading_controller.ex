defmodule ElectricityWeb.ElectricityReadingController do
  use ElectricityWeb, :controller

  alias ElectricityWeb.Readings
  alias ElectricityReadingAgent

  def store(conn, %{"smartMeterId" => smart_meter_id, "electricityReadings" => electricity_readings}) do
    ElectricityReadingAgent.store(smart_meter_id, electricity_readings)

    conn
    |> put_status(:created)
    |> json(%{message: "Readings stored successfully"})
  end

  def read(conn, %{"smart_meter_id" => smart_meter_id}) do
    readings = ElectricityReadingAgent.find(smart_meter_id)

    if length(readings) < 1 do
      conn
      |> put_status(:not_found)
      |> json(%{"error" => "No readings found"})
    else
      readings_json = for reading <- readings do
        reading_struct = struct(Readings, reading)
        Readings.to_json(reading_struct)
      end

      conn
      |> put_status(:ok)
      |> json(%{"data" => readings_json})
    end
  end
end

