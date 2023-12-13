class Market
  attr_reader :market_id,
              :name,
              :city,
              :state
  
  def initialize(data)
    @market_id = data[:id]
    @name = data[:name]
    @city = data[:city]
    @state = data[:state]
  end
end