class User < ActiveRecord::Base
    has_many :portfolios, dependent: :destroy

    def findByUsername
    end

    def getAllStocks
    end

    def getCurrentPortfolioValue
    end
end
