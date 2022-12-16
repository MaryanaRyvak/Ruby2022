require 'csv'
require './parser.rb'
require './cart.rb'

parser = Parser.new('https://www.yakaboo.ua/ua/knigi/komiksy-i-graficheskie-romany/komiksy.html?book_publisher=Mal_opus')

cart = Cart.new()

parser.parse()
cart.save_to_csv()
cart.save_to_json()