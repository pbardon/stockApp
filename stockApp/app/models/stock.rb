require 'open-uri'

class Stock < ActiveRecord::Base
    has_many :prices
    belongs_to :portfolio

    def self.find_by_ticker(symbol)
        if stock = Stock.find_by( symbol: symbol)
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

    def save_current_date
        self.date = Time.now
        self.save
    end

    def get_current_price
        price = prices.where("date > ?", 1.day.ago).take
        price.close
    end

    def get_prices_between_dates(start_date, end_date)
        # get all prices between two dates
    end

    def get_daily_price_and_volume
        #get the price and volume info for a stock daily (may need scheduling gem)
        daily_price = Price.new();
        daily_price.stock_id = self.id
        daily_price.retrieve_price_from_web(self.ticker)
        daily_price.save_date_information
        if daily_price.save
            return daily_price
        else
            return false
        end
    end
end
