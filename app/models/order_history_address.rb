class DonationAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :token, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number
    validates :user_id
  end

  def save
    order_history = OrderHistory.create(user_id: user_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id,
                   city: city, addresses: addresses, building: building, phone_number: phone_number, order_history_id: order_history.id)
  end
end
