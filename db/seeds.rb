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

User.all.each do |user|
  user.update(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end
