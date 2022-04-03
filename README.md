To start this program:
* run asdf install
* install dependencies with mix deps.get
* run iex -S mix

To calculate the total fuel needed for a spacecraft's flight path we need to run in iex:

iex>Nasa.calculate_fuel(5000, [{:launch, 9.807},{:land, 1.62},{:launch, 1.62}, {:land, 9.807}])

where 5000 is the weight of the space craft, followed by the launch or land action it takes in sequence, along with the
gravity for each celestial body the action will take place. For example, {:launch, 9.807} means that the craft will launch from Earth.