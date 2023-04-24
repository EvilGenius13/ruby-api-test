# Quick API calls in Ruby

##
Using .fetch to throw KeyErrors instead of nil values

```ruby
def call_api
    puts "Please enter a number or name of a pokemon:"
    @pokemon = gets.chomp
    response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{@pokemon}")
    @data = JSON.parse(response)
  end

  def print_data
    name = @data.fetch("name").capitalize
    id = @data.fetch("id")
    height = @data.fetch("height")
    weight = @data.fetch("weight")
    puts "Name: #{name}"
    puts "ID: #{id}"
    puts "Height: #{height}"
    puts "Weight: #{weight}"
  end
```

