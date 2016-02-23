require 'open-uri'

class Stock < ActiveRecord::Base
    has_many :prices
    belongs_to :portfolio

    def self.find_by_ticker(symbol)
        if stock = Stock.find_by( ticker: symbol)
            return stock
        else
            return false
        end
    end

    def self.process_list_of_tickers(symbol_array)
        # take a CSV list of tickers and create stock objs
        logger.info { "processing list of ticker symbols" }
        symbol_array.each do |symbol|
            logger.info { "Adding Stock Symbol: #{symbol} to database" }
            stock = Stock.new
            stock.ticker = symbol
            stock.save
        end
    end

    def get_current_price
        prices = self.prices.where("date > ?", 1.day.ago)
        if price = prices.take
            price.close
        else
            return false
        end
    end

    def get_prices_between_dates(start_date, end_date)
        # get all prices between two dates
    end

    def get_daily_price_and_volume
        #get the price and volume info for a stock daily (may need scheduling gem)
        daily_price = Price.create_daily_price(self);
        if daily_price
            return daily_price
        else
            return false
        end
    end
end
