require 'open-uri'

module WebScrapingHelper
    MARKETWATCH_BASE_URL = "http://www.marketwatch.com/investing/stock/"

    def get_web_page(web_address)
        doc = Nokogiri::HTML(open(web_address));
    end

    def get_marketwatch_page(ticker)
        url = construct_marketwatch_url(ticker)
        get_web_page(url)
    end

    def get_price_from_web(ticker)
        page = get_marketwatch_page(ticker)
        el = page.css("div.lastprice p.data.bgLast")
        el.children[0].text
    end

    def construct_marketwatch_url(ticker)
        url = MARKETWATCH_BASE_URL + ticker
        url.downcase()
    end


end
