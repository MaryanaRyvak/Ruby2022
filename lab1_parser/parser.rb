require 'open-uri'
require 'byebug'
require 'nokogiri'
require './book.rb'
require './item.rb'

class Parser

    def initialize(url)
        @url = url
    end

    def parse()
        begin
            html = URI.open(@url) { |result| result.read}
            doc = Nokogiri::HTML(html)
            i = 0
            doc.css('.product-listing view-category').each do |element|
                book = Item.new()
                book.name = element.css(".category-card__content").css(".category-grid-block__content").css(".ui-card-title category-card__name").text
                book.author = element.css(".category-card__content").css(".category-grid-block__content").css(".ui-card-author category-card__author").text
                book.price = element.css(".category-card__content").css(".category-grid-block__content")
                        .css(".ui-price-display category-grid-block__price").css('.ui-price-display__main').css('.current-price').text.split(" ")[0]
                book.price = book.price.to_i    
                book.image_link = element.css(".category-grid-block__poster").css(".product-image category-card-mode").css('.product-image__thumb').attr('src')
                book.id = i+1
                i= i+1

                if book.price > Rails.configuration.x.min.price
                    Book.set_item(sushi)
            end
        rescue OpenURI::HTTPError => e
            puts e.message
        end
    end
end