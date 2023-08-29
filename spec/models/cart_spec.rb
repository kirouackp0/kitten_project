require 'rails_helper.rb'

RSpec.describe Cart, type: :model do
  let(:item1) { create(:item) }
  let(:item2) { create(:item) }

  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:cart_items).dependent(:destroy) }
    it { should have_many(:items).through(:cart_items) }
  end

  context 'when cart is destroyed' do
    it 'should also destroy associated cart items' do
      cart = create(:cart)
      create_list(:cart_item, 3, cart:)

      expect { cart.destroy }.to change(CartItem, :count).by(-3)
    end
  end

  describe "user is created" do
    let(:user) { create(:user) }

    it "creates a cart linked to the user" do
      expect(user.cart).not_to be_nil
    end
  end

  describe "get_total" do
    it "returns the total price of all the cart_items" do
      cart = create(:cart)
      create(:cart_item, cart:, item: item1, quantity: 1)
      create(:cart_item, cart:, item: item2, quantity: 2)

      expected_price = item1.price + (item2.price * 2)

      expect(cart.get_total).to eq(expected_price)
    end
  end
end
