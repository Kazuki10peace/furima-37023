class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/i.freeze
  validates_format_of :last_name, with: NAME_REGEX
  validates_format_of :first_name, with: NAME_REGEX
  KANA_REGEX = /\A[ァ-ヶー－]+\z/i.freeze
  validates_format_of :last_name_kana, with: KANA_REGEX
  validates_format_of :first_name_kana, with: KANA_REGEX
  validates :birth_date, presence: true

  #まだ先の実装のためコメントアウトしています。
  #has_many :items
  #has_many :order_histories
end
