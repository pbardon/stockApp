class Portfolio < ActiveRecord::Base
    belongs_to :user
    has_many :stocks

# Need to keep track of how many stocks are owned
    has_many :owned_stocks
end
