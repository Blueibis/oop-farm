require_relative 'corn'
require_relative 'wheat'
require_relative 'potato'
require_relative 'pasture'

class Farm
@@fields = []
attr_reader :name, :sum
attr_writer :pasture

  def initialize(name)
    @name = name
    @sum = 0
    puts "You have named your farm: #{name}"
  end

  def store(crop)
    @@fields << crop
  end

  def self.all
    @@fields
  end

  def options_menu
    while true
      print_options_menu
      user_selected = gets.chomp
      option(user_selected)
    end
  end

  def print_options_menu
    puts "---------------------"
    puts "Options:"
    puts "field -> adds a new field"
    puts "harvest -> harvests crops"
    puts "status -> displays information"
    puts "relax -> enjoy the scenery"
    puts "REDACTED -> REDACTED the animals!"
    puts "exit -> exits the program"
    puts "---------------------"
  end

  def option(user_selected)
    case user_selected
    when "field" then add_field
    when "harvest" then harvest
    when "status" then status
    when "relax" then relax
    when "exit" then puts "Exiting the program..."
      exit
    when "free the animals" then free_the_animals
    else puts "There's no option for that."
    end
  end

  def add_field
    puts "What kind of field are you adding: corn, wheat, potato or a pasture?"
    input = gets.chomp
    if input.include?("pasture")
      return add_pasture
    elsif input != "corn" && input != "wheat" && input != "potato"
      return add_error
     else
     end
    puts "How large is your field in hectares?"
    size_input = gets.to_i
    if input == "corn"
      store(Corn.new(size_input))
    elsif input == "wheat"
      store(Wheat.new(size_input))
    else
      store(Potato.new(size_input))
    end
    puts "Added a #{input} field of #{size_input} hectares!"
  end

  def add_pasture
    puts "How many animals are you adding to your pasture?"
    result = gets.to_i
     @pasture = Pasture.new(result)
    puts "Added #{result} animals to your pasture."
  end

  def add_error
    puts "We can't plant that kind of field boss."
  end

  def harvested
    puts "The farm has harvested #{sum} food to date."
  end

  def harvest
    @@fields.each do |crop|
      @sum += crop.yield
      puts "Harvesting #{crop.yield} food from #{crop.hectares} hectare #{crop.type} field."
    end
    harvested
    harvest_pasture
  end

  def harvest_pasture
    @pasture.amount += Random.rand(@pasture.amount)
    puts "Your animals have breeded, now you have #{@pasture.amount} animals."
  end

  def status
    @@fields.each do |crop|
      puts "#{crop.type.capitalize} field is #{crop.hectares} hectares."
    end
    puts "You have #{@pasture.amount} animals in your pasture."
    harvested
  end

  def relax
      @@fields.each do |crop|
        puts relax_quote(crop.hectares, crop.type)
      end
      puts "You may or may not have animals in your pasture to admire.\nThe smell keeps you from admiring them."
  end

  def relax_quote(hectares, type)
    quotes = ["A golden glow spread across the sky as the sun chased the dark clouds away above your #{hectares} hectare field.",
      "It was a blindingly hot day and the humidity in the air was stifling.\nContinuing to admire your #{hectares} hectares of #{type} might give you heat stroke.",
      "The sun hangs low, casting an orange glow on a sea of #{hectares} hectares of #{type}.",
      "#{hectares} hectares of #{type} rustling in the breeze fill your horizon.",
      "Would'nt you rather be admiring your #{hectares} hectare field from behind some windows?",
      "Your fields are beautiful and so are you. Can we get back to work now?",
      "The setting sun sets a beautiful golden backdrop over the horizon as you rest among your #{type} fields.",
      "You take a minute to breath in the crisp autumn air and admire the rolling fields of gold in front of you."]
      quotes.sample
    end

    def free_the_animals
      @pasture.amount = 0
      puts "Someone forgot to remove the secret option to free the animals! You now have #{@pasture.amount} animals."
    end
end
