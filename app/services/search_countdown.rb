require 'open-uri'

class SearchCountdown
  SEARCH_URL = 'http://shop.countdown.co.nz/Shop/SearchProducts?search='

  def self.for(query)
    new(query).search
  end

  def initialize(query)
    @query = query
  end

  def search
    page = html_search_results
    ResultExtractor.new(page).results
  end

  private

  def html_search_results
    open([SEARCH_URL, sanitized_query].join)
  end

  def sanitized_query
    @query.gsub(" ", "%2B")
  end

  class ResultExtractor
    Product = Struct.new(:name, :price, :image_url)

    def initialize(html)
      @html = Nokogiri::HTML(html)
    end

    def results
      @html.css('#product-list .details-container').map(&method(:extract_result))
    end

    private

    def extract_result(product_html)
      Product.new(
        product_html.at_css('.description').text,
        product_html.at_css('.price').text.to_price,
        "http://shop.countdown.co.nz#{product_html.at_css('.product-image').attr('src')}",
      )
    end
  end
end
