class Product < ApplicationRecord
  references :user, index: true
  references :business, index: true
  has_one_attached :uploaded_image
  belongs_to :user


  def find_image_name
      if self.category == "Glass"
        image_name = "glass.jpg"
      elsif self.category == "Cardboard"
        image_name = "cardboard.jpg"
      elsif self.category == "Textile"
        image_name = "textile.jpg"
      elsif self.category == "PET Plastic"
        image_name = "pet.jpg"
      elsif self.category == "Batteries"
        image_name = "batteries.jpg"
      elsif self.category == "Alluminium"
        image_name = "alluminium.jpg"
      end
      image_name
  end

  def postage_calc
    if self.quantity < 5
      postage = 8.90
    else
      postage = 8.90 + (self.quantity-5)
    end
    return postage
  end

end