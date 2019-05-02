class Product < ApplicationRecord
  references :user, index: true
  references :business, index: true
  has_one_attached :uploaded_image
  belongs_to :user
  
  
  
end
