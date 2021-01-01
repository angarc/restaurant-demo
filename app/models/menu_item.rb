class MenuItem < ApplicationRecord
  validates_presence_of :name, :price

  has_one_attached :featured_image

  belongs_to :menu_item_category
end
