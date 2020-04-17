require "faker"

def random_user_id
  User.all.shuffle.first.id
end

5.times do |index|
  User.create(
    display_name: Faker::Name.name,
    email: "user_#{index + 1}@gmail.com",
    password: "password",
  )
end

5.times do
  Message.create(
    body: Faker::Lorem.sentence,
    user_id: random_user_id,
  )
end

5.times do
  Message.create(
    body: Faker::Lorem.paragraph,
    user_id: random_user_id,
  )
end
