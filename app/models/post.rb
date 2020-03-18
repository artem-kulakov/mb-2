class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  enum category: [
    'Design',
    'Art',
    'Graphic',
    'Wordpress',
    'HTML/CSS',
    'SASS'
  ]

  def hero
    self[:hero] || "/assets/img/1920x1080/img29.jpg"
  end

  def formatted_date
    date.strftime("%B %e, %Y")
  end
end
