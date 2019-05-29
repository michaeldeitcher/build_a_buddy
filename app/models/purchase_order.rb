class PurchaseOrder < ApplicationRecord
  has_and_belongs_to_many :accessories
  has_and_belongs_to_many :stuffed_animals
end
