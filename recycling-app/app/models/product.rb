class Product < ApplicationRecord
  references :user, index: true
  references :business, index: true
  has_one_attached :uploaded_image
  belongs_to :user


  def find_image_name
      if self.category == "Glass"
        image_name = "https://s3-ap-southeast-2.amazonaws.com/i-recycle-app/glass.jpg"
      elsif self.category == "Cardboard"
        image_name = "https://s3-ap-southeast-2.amazonaws.com/i-recycle-app/cardboard.jpg"
      elsif self.category == "Textile"
        image_name = "https://s3-ap-southeast-2.amazonaws.com/i-recycle-app/textile.jpg"
      elsif self.category == "PET Plastic"
        image_name = "https://s3-ap-southeast-2.amazonaws.com/i-recycle-app/pet.jpg"
      elsif self.category == "Batteries"
        image_name = "https://s3-ap-southeast-2.amazonaws.com/i-recycle-app/batteries.jpg"
      elsif self.category == "Aluminium"
        image_name = "https://s3-ap-southeast-2.amazonaws.com/i-recycle-app/aluminium.jpg"
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

  def glass
    if self.category == "Glass"
      return self
    end
  end

end