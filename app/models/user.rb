class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

 with_options presence: true do
  validates :name, length: { maximum: 40 }
 with_options format: { with: ~/^[^ -~｡-ﾟ]*$/ } do
  validates :first_name
  validates :last_name
 end
 with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'Full-width katakana characters' } do
  validates :first_name_kana
  validates :last_name_kana
 end
  validates :birthday
 end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end

