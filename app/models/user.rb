class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 with_options presence: true do
  validates :name, length: { maximum: 40 }
  validates :email, uniqueness: true
  validates :encrypted_password
  validates :first_name
  validates :last_name
  validates :first_name_kana, format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/ }
  validates :last_name_kana, format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/}
  validates :birthday, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
 end
end
