class Item < ApplicationRecord

  has_one_attached :image
  has_one :purchase_history
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipment

 with_options presence: true do
  validates :image
  validates :name
  validates :description, length: { maximum: 40 }
  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
 end
 with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :burden_id
  validates :prefecture_id
  validates :shipment_id
 end
end
