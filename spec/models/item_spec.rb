require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { create(:item) }

  context 'associations' do
    it { should have_one_attached(:picture) }
    it { should have_many(:cart_items) }
    it { should have_many(:carts).through(:cart_items) }
  end

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(5).is_at_most(50) }
    it { should validate_length_of(:description).is_at_least(10).is_at_most(1000) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  end

  it "should allow valid image URL formats" do
    item.image_url = "http://example.com/image.png"
    expect(item).to be_valid
  end

  it "should not allow price with more than two decimal places" do
    item.price = 10.567
    expect(item).to_not be_valid
  end

  it "should not allow invalid image URL formats" do
    item.image_url = "not a real url"
    expect(item).to_not be_valid
  end

  context 'picture attachment' do
    it 'should have a picture attached' do
      item = build(:item)
      expect(item.picture).to be_attached
    end
  end

  it "should only allow image attachment" do
    item = FactoryBot.create(:item)
    item.picture.attach(io: File.open('spec/fixtures/sample.pdf'), filename: 'sample.pdf', content_type: 'application/pdf')
    expect(item).to_not be_valid
  end
end
