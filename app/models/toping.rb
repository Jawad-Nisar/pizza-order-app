class Toping < ApplicationRecord
  validates :name, presence: true
  belongs_to :item, dependent: :destroy
end
