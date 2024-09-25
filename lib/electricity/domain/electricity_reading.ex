defmodule ElectricityReading do
  defstruct time: nil, reading: nil

  def new(json) do
    %ElectricityReading{
      time: Map.get(json, "time"),
      reading: Map.get(json, "reading")
    }
  end

  def to_json(electricity_reading) do
    json = %{}
    json = Map.put(json, "time", electricity_reading.time)
    json = Map.put(json, "reading", electricity_reading.reading)
    json
  end
end

