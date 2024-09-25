defmodule ElectricityReadingRepository do
  def new do
    %{
      meter_associated_readings: %{}
    }
  end

  def store(repository, smart_meter_id, readings) do
    existing_readings = Map.get(repository.meter_associated_readings, smart_meter_id, [])
    updated_readings = existing_readings ++ readings
    updated_map = Map.put(repository.meter_associated_readings, smart_meter_id, updated_readings)
    %{repository | meter_associated_readings: updated_map}
  end

  def find(repository, smart_meter_id) do
    Map.get(repository.meter_associated_readings, smart_meter_id, [])
  end
end

