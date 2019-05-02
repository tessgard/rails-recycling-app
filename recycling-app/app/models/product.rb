class Product < ApplicationRecord
  references :user, index: true
  references :business, index: true
  has_one_attached :uploaded_image
  belongs_to :user

  def find_image_name
      if self.category == "Glass"
        image_name = "glass.jpg"
      elsif self.category == "Cardboards"
        image_name = "cardboard.jpg"
      end
      image_name
  end
end
