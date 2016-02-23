class User < ActiveRecord::Base
    has_many :portfolios, dependent: :destroy

    def self.find_by_username(username)
        user = User.find_by username: username
        if user
            return user
        else
            return false
        end
    end

    def getAllStocks
        stocksOwned = []
        self.portfolios.each do |portfolio|
            portfolio.stocks.map { |e| stocksOwned << e  }
        end
        return stocksOwned
    end

    def getCurrentPortfolioValue
    end
end
