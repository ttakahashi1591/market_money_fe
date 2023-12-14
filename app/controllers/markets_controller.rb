class MarketsController < ApplicationController
  def index
    @facade = MarketsFacade.new
  end

  def show

  end
end