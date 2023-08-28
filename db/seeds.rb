# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
Item.destroy_all

20.times do
  Item.create!(
    title: Faker::Lorem.characters(number: 10),
    description: Faker::Lorem.sentence(word_count: 10),
    price: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    image_url: 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Fimages2.alphacoders.com%2F467%2F467417.jpg&sp=1693215288Tecf725d059fb756d1d5be9f6a2ae853458d43bf672eb267da2475c46ac79865f'
  )
end
