class Transaction < ApplicationRecord
  references :business, index: true
  references :user, index: true
  belongs_to :user
  belongs_to :business
  belongs_to :product
end
