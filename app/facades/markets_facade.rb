class MarketsFacade
  def market_index
    service = MarketMoneyService.new

    data = service.markets_list
    
    data[:data][0][:attributes].map do |data|
      Market.new(data)
    end
  end
end