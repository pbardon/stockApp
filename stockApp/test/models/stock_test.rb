require 'test_helper'

class StockTest < ActiveSupport::TestCase

  test "should be able to find stock by ticker symbol" do
      stock = Stock.find_by_ticker(stocks(:apple).ticker)
      assert stock.ticker == stocks(:apple).ticker
  end

  test "should be able to process list of tickers into stock objects" do
    Stock.process_list_of_tickers([stocks(:apple).ticker,
                                  stocks(:google).ticker,
                                  stocks(:goldmansachs).ticker,
                                  stocks(:disney).ticker])
    appleStock = Stock.find_by_ticker(stocks(:apple).ticker)
    googleStock = Stock.find_by_ticker(stocks(:google).ticker)
    goldmanStock = Stock.find_by_ticker(stocks(:goldmansachs).ticker)
    disneyStock = Stock.find_by_ticker(stocks(:disney).ticker)

    assert appleStock.ticker == stocks(:apple).ticker
    assert googleStock.ticker == stocks(:google).ticker
    assert goldmanStock.ticker == stocks(:goldmansachs).ticker
    assert disneyStock.ticker == stocks(:disney).ticker
  end

  test "should be able to retrieve price and daily volume from web" do
    stock = Stock.find_by_ticker(stocks(:apple).ticker)
    price = stock.get_daily_price_and_volume
    puts price.open
    assert_not_nil price.close
    assert price.date.day == Time.now.day
    assert price.stock_id == stock.id
  end

  test "should be able to get the current price" do
    stock = Stock.find_by_ticker(stocks(:apple).ticker)
    stock.get_daily_price_and_volume
    current_price = stock.get_current_price
    assert_not_nil current_price
  end

end
