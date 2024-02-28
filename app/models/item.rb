class Item < ApplicationRecord
  validates :name, presence: true
  belongs_to :order, dependent: :destroy
end
