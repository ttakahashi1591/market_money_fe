class Market
  attr_reader :market_id,
              :name,
              :city,
              :state
  
  def initialize(data)
    @market_id = data[:id]
    @name = data[:attributes][:name]
    @city = data[:attributes][:city]
    @state = data[:attributes][:state]
  end
end