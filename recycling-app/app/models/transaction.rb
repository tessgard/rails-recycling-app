class Transaction < ApplicationRecord
  belongs_to :people
  belongs_to :business
  belongs_to :product
end
