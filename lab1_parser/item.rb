class Item
    attr_accessor :id, :name, :price, :image_link, :description

    def initialize(id = 0, name ='', price = 0, image_link = '', description = '')
        @id = id
        @name = name
        @price = price
        @image_link = image_link
        @description = description
    end

    def to_s()
        "id=#@id, name=#@name, price=#@price, image_link=#@image_link,
         description=#@description"
    end

    def to_h()
        {'id' => @id, 'name'=> @name, 'price' => @price, 
            'image_link' => @image_link, 'description' => @description}
    end

    def info()
        yield
    end

end