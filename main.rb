require 'rest-client'
require 'json'

class Api
  attr_reader :data

  def initialize(name)
    @name = name
    @data = nil
  end

  def name
    puts "Hello #{@name}"
  end

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
end

env = Api.new("Pokemon API")
env.name
env.call_api
env.print_data
