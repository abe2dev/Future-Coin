class HomeController < ApplicationController

  def index
    require 'net/http'
    require 'json'

    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=100&CMC_PRO_API_KEY=04ef0392-f679-4445-9def-032ff85c4599'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = ["BTC", "ETH", "ADA", "SOL", "DOT"]
  end
  
  def about
  end
  
  def lookup
    require 'net/http'
    require 'json'
    
    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=100&CMC_PRO_API_KEY=04ef0392-f679-4445-9def-032ff85c4599'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    # puts @response --> This one helps me to find my data then take this data
    @lookup_coin = JSON.parse(@response)["data"]
    @symbol = params[:sym]
    if @symbol
      @symbol = @symbol.upcase
    end
    if @symbol == ""
      @symbol = "You Forgot To Enter A Currency!"
    end
  end
end