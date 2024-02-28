class Item < ApplicationRecord
  has_many :topings
  belongs_to :order
end
