class MarketsFacade
  def market_index
    service = MarketMoneyService.new

    data = service.markets_list
 
    data[:data].map do |data|
      Market.new(data)
    end
  end

  def market_show(market_id)
    service = MarketMoneyService.new

    data = service.market(market_id)

    data[:data].map do |data|
      Market.new(data)
    end
  end
end