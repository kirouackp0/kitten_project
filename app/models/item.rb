class Item < ApplicationRecord
    has_one_attached :picture 
    validates :title, presence: true, length: {in:5..50}
    validates :description, presence: true, length: {in:10..1000}
    validates :price, presence: true 
    validates :image_url, presence: true 
    
end
