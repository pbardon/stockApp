class Price < ActiveRecord::Base
    belongs_to :stock

    def retrievePriceFromWeb

        # retrieve price and volume information for the day

    end

end
