class Item < ApplicationRecord

  validates :name, precence: true
  validates :info, precence: true
  validates :category, precence: true
  validates :sales_status, precence: true
  validates :shipping_fee, precence: true
  validates :prefecture, precence: true
  validates :scheduled_delivery, precence: true
  PRICE_REGEX = /^[0-9]+$/.freeze
  validates_format_of :price, precence: true, numericality: { in: 300..9999999 }, with: PRICE = REGEX

  #まだ先の実装の分はコメントアウト
  belings_to :user
  #has_one :order_history
  has_one_attached :image
end
