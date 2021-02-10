class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipment

 with_options presence: true do
  validates :image
 with_options numericality: { other_than: 1 } do
  validates :category
  validates :status
  validates :burden
  validates :prefecture
  validates :shipment
 end
 end
end
