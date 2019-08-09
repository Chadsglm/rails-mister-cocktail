require 'json'
require 'open-uri'

puts 'Cleaning database...'
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Creating Ingredient...'

url_ingredient = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url_ingredient).read
ingredient_list = JSON.parse(ingredient_serialized)
ingredient = ingredient_list['drinks']

ingredient.each do |ing|
  Ingredient.create(name: ing['strIngredient1'])
end

puts 'Finished ingredients.'

puts 'Creating cocktails...'

url_cocktails = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'

cocktail_json_file = open(url_cocktails).read
result_cocktails = JSON.parse(cocktail_json_file)
cocktail = result_cocktails['drinks']

cocktail.each do |element|
  Cocktail.create(
    name: element['strDrink'],
    img_url: element['strDrinkThumb']
  )
end

puts 'Finished cocktails.'

puts 'Creating doses...'

url_doses = 'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=11007'

dose_json_file = open(url_doses).read
result_doses = JSON.parse(dose_json_file)
dose = result_doses['drinks']

dose.each do |element|
  10.times do
    Dose.create(
      description: element['strInstructions'],
      ingredient: ingredient.sample
    )
  end
end

puts 'Finished doses.'
