class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :business
  belongs_to :product
end
