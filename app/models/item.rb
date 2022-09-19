class Item < ApplicationRecord

  #↓以下associationの記載↓
  belongs_to :genre
  has_many :cart_items, dependent: :destroy

  #↓以下Validationの記載↓
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  #booleanの場合↓要確認
  validates :completed, inclusion: { in: [true, false] }
  #enumの定義↓要確認
  enum is_active: { 販売中: 0, 販売停止中: 1 }


end
