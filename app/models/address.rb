class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :order_history
  belongs_to :prefecture

end