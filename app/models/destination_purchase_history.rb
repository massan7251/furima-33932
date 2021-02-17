class DestinationPurchaseHistory
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :purchase_history_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{,11}+\z/ }
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    destination = Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end 