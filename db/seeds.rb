# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Cocktail.all.each {|coc| coc.destroy}

url = Nokogiri::HTML(open("http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"))
seeds = JSON.parse(url)
seeds["drinks"].each do |record|
  Cocktail.create!(name: record["strDrink"], image: record["strDrinkThumb"])
end

