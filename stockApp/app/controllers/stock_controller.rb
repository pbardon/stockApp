class StockController < ApplicationController
    def show
    end

    def post
    end

    def process_list_of_ticker_symbols(symbol_array)
        Stock.process_list_of_ticker_symbols(symbol_array)
    end

end
