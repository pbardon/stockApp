class Stock < ActiveRecord::Base
    has_many :prices
    belongs_to :portfolio

    def findByTicker
    end

    def getCurrentPrice
    end

    def getPricesBetweenDates
        # get all prices between two dates
    end

    def processListOfTickers
        # take a CSV list of tickers and create stock objs
    end

    def retrieveInformation
        # Get the information about a stock from some web service
    end

    def getDailyPriceAndVolume
        #get the price and volume info for a stock daily (may need scheduling gem)
    end
end
