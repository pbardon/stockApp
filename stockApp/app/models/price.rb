require 'open-uri'

class Price < ActiveRecord::Base
    belongs_to :stock

    def self.get_web_page(web_address)
        doc = Nokogiri::HTML(open(web_address));
    end

    def self.create_daily_price(stock)
        daily_price = Price.new
        daily_price.stock_id = stock.id
        daily_price.retrieve_price_from_web(stock.ticker)
        daily_price.save_date_information
        if daily_price.save
            return daily_price
        else
            return false
        end
    end

    def self.get_marketwatch_page(ticker)
        url = self.construct_marketwatch_url(ticker)
        get_web_page(url)
    end

    def self.get_price_info_from_web(ticker)
        page = self.get_marketwatch_page(ticker)
        open_price = self.process_open_price(page.css("div.openpricetext"))
        close_price = self.process_close_price(page.css("div.lastprice > div > p.data.bgLast"))
        {open: open_price, close: close_price }
    end

    def self.process_open_price(el)
        str = el.children[0].text.strip
        str = str.slice(str.index(/[0-9]/), str.length-1)
    end

    def self.process_close_price(el)
        el.children[0].text
    end

    def self.construct_marketwatch_url(ticker)
        mkt_watch_url = "http://www.marketwatch.com/investing/stock"
        url = "#{mkt_watch_url}/#{ticker}"
        url.downcase()
    end

    def retrieve_price_from_web(symbol)
        # retrieve price and volume information for the day
        self.close = Price.get_price_info_from_web(symbol)
        if self.save
            return self.close
        else
            return false
        end
    end

    def save_date_information
        self.date = Time.now
        if self.save
            return self.date
        else
            false
        end
    end

end
