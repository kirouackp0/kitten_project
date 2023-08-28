FactoryBot.define do
  factory :cart_item do
    cart { create(:cart) }
    item { create(:item) }
    quantity { rand(1..4) }
  end
end
