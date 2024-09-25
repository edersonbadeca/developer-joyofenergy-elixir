defmodule ElectricityReadingAgent do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def store(smart_meter_id, readings) do
    Agent.update(__MODULE__, fn state ->
      existing_readings = Map.get(state, smart_meter_id, [])
      updated_readings = existing_readings ++ readings
      Map.put(state, smart_meter_id, updated_readings)
    end)
  end

  def find(smart_meter_id) do
    Agent.get(__MODULE__, fn state ->
      Map.get(state, smart_meter_id, [])
    end)
  end
end

