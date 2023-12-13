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
end