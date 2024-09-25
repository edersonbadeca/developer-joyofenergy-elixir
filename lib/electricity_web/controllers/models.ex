defmodule Readings do
  defstruct time: nil, reading: nil

  def new(params) do
    %Readings{
      time: Map.get(params, "time"),
      reading: Map.get(params, "reading")
    }
  end
end

defmodule ElectricReading do
  defstruct smartMeterId: nil, electricityReadings: []

  def new(params) do
    readings = []
    for reading <- Map.get(params, "electricityReadings") do
      readings = readings ++ [Readings.new(reading)]
    end
    %ElectricReading{
      smartMeterId: Map.get(params, "smartMeterId"),
      electricityReadings: readings
    }
  end
end

defmodule PricePlanComparisons do
  defstruct pricePlanId: nil, pricePlanComparisons: []

  def new(params) do
    comparisons = []
    for comparison <- Map.get(params, "pricePlanComparisons") do
      comparisons = comparisons ++ [comparison]
    end
    %PricePlanComparisons{
      pricePlanId: Map.get(params, "pricePlanId"),
      pricePlanComparisons: comparisons
    }
  end
end

defmodule OpenApiExamples do
  def get() do
    %{
      "Sarah" => %{"value" => "smart-meter-0"},
      "Peter" => %{"value" => "smart-meter-1"},
      "Charlie" => %{"value" => "smart-meter-2"},
      "Andrea" => %{"value" => "smart-meter-3"},
      "Alex" => %{"value" => "smart-meter-4"}
    }
  end
end

