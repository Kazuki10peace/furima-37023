class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, numericality: { presence: true, message: "を入力してください"}
  validates :name, numericality: { presence: true, message: "を入力してください"}
  validates :info, numericality: { presence: true, message: "を入力してください"}
  validates :category_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :sales_status_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :price, numericality: { presence: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'を指定できる値で入力してください', only_integer: true }

  belongs_to :user
  has_one :order_history
  has_one_attached :image

  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end
