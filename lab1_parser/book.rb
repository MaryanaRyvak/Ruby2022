require "./item.rb"

class Book
    @@book = []

    def self.set_item(item)
        @@book.push(item)
    end

    def self.get_All()
        @@book
    end
end