class MainApplication < Rails::Application
    config.load_defaults 5.1

    config.x.path.to.save = "~/data"
    config.x.json.file.name = "comics_list.json"
    config.x.csv.file.name = "comics_list.csv"
    config.x.min.price = 350
    end
end