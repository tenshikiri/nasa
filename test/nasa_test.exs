defmodule NasaTest do
  use ExUnit.Case
  doctest Nasa

  @apollo11 28801
  @mars_mission 14606
  @passenger_ship 75432

  test "Apollo11 - launch Earth, land Moon, launch Moon, land Earth" do
    path = [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 9.807}]
    assert Nasa.calculate_fuel(@apollo11, path) == 51898
  end

  test "Mission to Mars - launch Earth, land Mars, launch Mars, land Earth" do
    mars_path = [{:launch, 9.807}, {:land, 3.711}, {:launch, 3.711}, {:land, 9.807}]
    assert Nasa.calculate_fuel(@mars_mission, mars_path) == 33388
  end

  test "Passenger ship - launch Earth, land Moon, launch Moon, land Mars, launch Mars, land Earth" do
    cruise_path = [
      {:launch, 9.807},
      {:land, 1.62},
      {:launch, 1.62},
      {:land, 3.711},
      {:launch, 3.711},
      {:land, 9.807}
    ]

    assert Nasa.calculate_fuel(@passenger_ship, cruise_path) == 212_161
  end
end
