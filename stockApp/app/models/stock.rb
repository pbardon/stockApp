class Stock < ActiveRecord::Base
    has_many :prices
    belongs_to :portfolio
end
