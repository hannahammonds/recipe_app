# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'
# images = [
#     "https://tse4.mm.bing.net/th?id=OIP.Q8DkndBzfTOhULcFiKn2NQHaFD&pid=Api&P=0&w=267&h=182",
#     "https://tse4.mm.bing.net/th?id=OIP.ay2rwpFv_9BCxqqjze-QkwHaE8&pid=Api&P=0&w=274&h=182",
#     "https://tse3.mm.bing.net/th?id=OIP.hrtc1-lKzGnxfqA3SeA0_gHaDJ&pid=Api&P=0&w=427&h=181",
#     "https://tse2.explicit.bing.net/th?id=OIP.BC7ArCQQZ7CKSgSC0qi6rAHaD4&pid=Api&P=0&w=302&h=158",
# ]
# (1..100).each do |i| 
#     Recipe.create(name: Faker::Food.dish, ingredients: Faker::Food.ingredient, instructions: Faker::Food.description, image_path: images[Random.rand(4)])
# end 

#grab category path and set it = to the picture file 

Category.all[6].update(image_path: "spring.jpeg") 
Category.all[7].update(image_path: "summer 2.jpeg")
Category.all[8].update(image_path: "fall2.jpeg")
Category.all[9].update(image_path: "winter.jpeg")
