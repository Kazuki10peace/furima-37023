class OrderHistoryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :token, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "を正しく入力してください"}
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "を正しく入力してください"}
  validates :addresses, numericality: { presence: true, message: "を入力してください"}
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "を正しく入力してください" }
  validates :user_id, numericality: { presence: true, message: "を入力してください"}
  validates :item_id, numericality: { presence: true, message: "を入力してください"}
  validates :token, numericality: { presence: true, message: "を入力してください"}

  def save
    order_history = OrderHistory.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building,
                   phone_number: phone_number, order_history_id: order_history.id)
  end
end
