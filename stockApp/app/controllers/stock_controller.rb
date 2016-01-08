class StockController < ApplicationController
    def show
    end

    def post
    end

    def process_list_of_ticker_symbols(symbol_array)
        logger.info { "processing list of ticker symbols" }
        symbol_array.each do |symbol|
            logger.info { "Adding Stock Symbol: #{symbol} to database" }
            stock = Stock.new
            stock.ticker = symbol
            stock.save
        end
    end

end
