class Item < ApplicationRecord

  #↓以下associationの記載↓
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_one_attached :item_image

  #↓以下Validationの記載↓
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true


  def get_item_image
    (item_image.attached?) ? item_image : "no_image.jpg"
  end




end
