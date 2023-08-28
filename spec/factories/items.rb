FactoryBot.define do
  factory :item do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 10.0..100.0) }
    image_url { Faker::Internet.url }

    after(:build) do |item|
      item.picture.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'example.jpg')),
        filename: 'example.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
