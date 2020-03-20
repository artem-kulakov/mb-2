# User.delete_all
# Post.delete_all

# User.create(
#   email: 'a@a.com',
#   password: '123456',
#   password_confirmation: '123456'
# )

# 20.times do
#   User.create(
#     email: Faker::Internet.email,
#     password: '123456',
#     password_confirmation: '123456'
#   )
# end

# 20.times do |index|
#   Post.create(
#     title: Faker::Lorem.sentence(word_count: 3),
#     subtitle: Faker::Lorem.sentence(word_count: 9),
#     user_id: index + 2,
#     date: Faker::Date.backward(days: 90),
#     body: Faker::Lorem.sentence(word_count: 70)
#   )
# end

# Post.all.each do |post|
#   post.update(
#     # image: "/assets/img/500x250/img#{1+rand(14)}.jpg",
#     # category: rand(6),
#     # hero: "/assets/img/1920x1080/img#{1+rand(39)}.jpg",
#     # body: Faker::Lorem.sentence(word_count: 400),
#     created_at: Faker::Date.backward(days: 90)
#   )
# end

# indexes = [1,2,3,4,14,15,16,17]

# User.all.each do |user|
#   user.update(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     image: "/assets/img/100x100/img#{indexes.sample}.jpg",
#     bio: Faker::Lorem.sentence(word_count: 50)
#   )
# end

# user_ids = (User.pluck(:id) * 40).shuffle
# post_ids = (User.pluck(:id) * 40).shuffle

# 400.times do
#   Comment.create(
#     user_id: user_ids.pop,
#     body: Faker::Lorem.sentence(word_count: 50),
#     post_id: post_ids.pop,
#     created_at: Faker::Date.backward(days: 90)
#   )
# end

# Comment.all.each do |comment|
#   comment.update(
#     body: Faker::Lorem.sentence(word_count: 10, random_words_to_add: 40)
#   )
# end

comment_ids = (Comment.pluck(:id) * 20).shuffle
user_ids = (User.pluck(:id) * 200).shuffle

2000.times do
  Like.create(
    user_id: user_ids.pop,
    comment_id: comment_ids.pop,
    value: [true, false].sample
  )
end
