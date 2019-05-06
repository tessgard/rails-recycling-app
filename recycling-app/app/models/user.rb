class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :transactions

def destroy
    update_attributes(deactivated: true) unless deactivated
end

def active_for_authentication?
  super && !deactivated
end

end
