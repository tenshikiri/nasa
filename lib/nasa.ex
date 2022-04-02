defmodule Nasa do
  @doc """
  Accepts an input argument with the mass of the craft and the path it needs to follow,
  then reverses the order of the path and calculates the amount of fuel needed in order to complete each step.


  ## example

  iex> Nasa.calculate_fuel(5000, [{:launch, 9.807},{:land, 1.62},{:launch, 1.62}, {:land, 9.807}])
  8240

  iex> Nasa.calculate_fuel(28801, [{:launch, 9.807},{:land, 3.711}])
  26353
  """
  def calculate_fuel(mass, path) do
    path
    |> Enum.reverse()
    |> Enum.reduce(0, fn step, acc -> step_fuel(step, mass, acc) + acc end)
  end

  defp step_fuel({:land, gravity}, mass, additional_mass) do
    total_mass = mass + additional_mass
    fuel = trunc(total_mass * gravity * 0.033 - 42)

    if fuel > 0, do: fuel + step_fuel({:land, gravity}, fuel, 0), else: 0
  end

  defp step_fuel({:launch, gravity}, mass, additional_mass) do
    total_mass = mass + additional_mass
    fuel = trunc(total_mass * gravity * 0.042 - 33)

    if fuel > 0, do: fuel + step_fuel({:launch, gravity}, fuel, 0), else: 0
  end
end
