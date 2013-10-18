class Apartment

  attr_accessor :price, :is_occupied, :sqft, :num_beds, :num_baths, :renters

  def initialize
    @renters = []
  end

end