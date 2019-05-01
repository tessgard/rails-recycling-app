class Transaction < ApplicationRecord
  references :business, index: true
  belongs_to :user
  belongs_to :business
  belongs_to :product
end
