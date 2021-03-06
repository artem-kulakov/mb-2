class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  has_one :cart
  has_many :line_items, through: :cart
  has_many :products, through: :line_items

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    first_name + ' ' + last_name
  end

  def image
    self[:image] || "/assets/img/100x100/img18.jpg"
  end
end
