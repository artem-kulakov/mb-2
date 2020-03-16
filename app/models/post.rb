class Post < ApplicationRecord
  belongs_to :user

  enum category: [
    'Design',
    'Art',
    'Graphic',
    'Wordpress',
    'HTML/CSS',
    'SASS'
  ]
end
