defmodule ElectricityWeb.ElectricityReadingService do
  alias ElectricityWeb.ElectricReading

  def new(repository) do
    %{
      electricity_reading_repository: repository
    }
  end

  def store_reading(service, params) do
    readings = for reading <- params["electricityReadings"], do: ElectricReading.new(reading)
    repository = service.electricity_reading_repository
    ElectricityReadingRepository.store(repository, params["smartMeterId"], readings)
  end

  def retrieve_readings_for(service, smart_meter_id) do
    repository = service.electricity_reading_repository
    ElectricityReadingRepository.find(repository, smart_meter_id)
  end
end


defmodule ElectricityWeb.ElectricReading do
  @derive {Jason.Encoder, only: [:time, :reading]}
  defstruct [:time, :reading]

  def new(%{"time" => time, "reading" => reading}) do
    %ElectricityWeb.ElectricReading{
      time: time,
      reading: reading
    }
  end
end



defmodule ElectricityWeb.Readings do
  @derive {Jason.Encoder, only: [:time, :reading]}
  defstruct [:time, :reading]

  def to_json(%ElectricityWeb.Readings{time: time, reading: reading}) do
    %{
      "time" => time,
      "reading" => reading
    }
  end
end


