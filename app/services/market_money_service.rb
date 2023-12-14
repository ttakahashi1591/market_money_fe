class MarketMoneyService < ApplicationService
  def conn
    Faraday.new(url: 'http://localhost:3000')
  end

  def get_url(url)
    conn.get(url)
  end

  def markets_list
    json_parse(get_url('/api/v0/markets'))
  end

  def market(market_id)
    json_parse(get_url("/api/v0/markets/#{market_id}"))
  end

  def vendor(vendor_id)
    json_parse(get_url("api/vo/vendors/#{vendor_id}"))
  end
end