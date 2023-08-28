FactoryBot.define do
  factory :cart_item do
    cart { create(:cart) }
    item { create(:item) }
  end
end
