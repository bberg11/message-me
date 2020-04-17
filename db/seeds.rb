require "faker"

def random_user_id
  User.all.shuffle.first.id
end

5.times do |index|
  User.create(email: "user_#{index}@gmail.com", password: "password")
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
