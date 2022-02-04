class Item < ApplicationRecord

  validates :name, precence: true
  validates :info, precence: true
  validates :category_id, precence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id, precence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id, precence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, precence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, precence: true, numericality: { other_than: 1 , message: "can't be blank"}
  PRICE_REGEX = /^[0-9]+$/.freeze
  validates_format_of :price, precence: true, numericality: { in: 300..9999999 }, with: PRICE = REGEX

  #まだ先の実装の分はコメントアウト
  belings_to :user
  #has_one :order_history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end
