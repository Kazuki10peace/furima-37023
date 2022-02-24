class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, numericality: { presence: true, message: "を入力してください"}
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "を入力してください"
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/i.freeze
  validates_format_of :last_name, with: NAME_REGEX, message: "を正しく入力してください"
  validates_format_of :first_name, with: NAME_REGEX, message: "を正しく入力してください"
  KANA_REGEX = /\A[ァ-ヶー－]+\z/i.freeze
  validates_format_of :last_name_kana, with: KANA_REGEX, message: "を正しく入力してください"
  validates_format_of :first_name_kana, with: KANA_REGEX, message: "を正しく入力してください"
  validates :birth_date, numericality: { presence: true, message: "を入力してください"}

  has_many :items
  has_many :order_histories
end
