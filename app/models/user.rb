class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, numericality: { presence: true, message: "を入力してください"}
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, numericality: { with: PASSWORD_REGEX, message: "を入力してください"}
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/i.freeze
  validates :last_name, numericality: { with: NAME_REGEX, message: "を正しく入力してください"}
  validates :first_name, numericality: { with: NAME_REGEX, message: "を正しく入力してください"}
  KANA_REGEX = /\A[ァ-ヶー－]+\z/i.freeze
  validates :last_name_kana, numericality: { with: KANA_REGEX, message: "を正しく入力してください"}
  validates :first_name_kana, numericality: { with: KANA_REGEX, message: "を正しく入力してください"}
  validates :birth_date, numericality: { presence: true, message: "を入力してください"}

  has_many :items
  has_many :order_histories
end
