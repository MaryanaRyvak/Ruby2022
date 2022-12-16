require 'open-uri'
require 'byebug'
require 'nokogiri'
require 'csv'
require 'json'
require './book.rb'
require './item.rb'

class Cart

    def save_to_csv()
        path_csv = './comics_list.csv'
        books = Book.get_All()
        puts books
        begin  
            File.new(path_csv, "w")
            
            CSV.open(path_csv, "w", headers: ['Id', 'Name', 'Price', 'Image link', 'Description'], write_headers: true) do |csv|
                books.each do |book|
                    csv << [book.id, book.name, book.price, book.image_link, product.description]
                end
            end

            puts "All books were writen in to the .csv file"
        rescue StandardError => e
            puts e.message
            puts "Can not open the .csv file for writing"
        end

    def save_to_json()
        path_json = './comics_list.json'
        books = Book.get_All()

        begin 
            File.new(path_json, "w")

            File.open(path_json, "w") do |json|
                books.each do |book|
                    temp_hash = {
                        "Id" => book.id,
                        "Name" => book.name,
                        "Price" => book.price,
                        "Image link" => book.image_link, 
                        "Description" => book.description
                    }

                    json.write(JSON.pretty_generate(temp_hash))
                end
            end
        end

            puts "All books were writen in to the .json file"
        rescue StandardError => e
            puts e.message
            puts "Can not open the .json file for writing"
        end
    end
end
