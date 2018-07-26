require 'faker'

10.times do
  city = City.create(
    name: Faker::Pokemon.location,
    postal_code: Faker::Number.number(5)
  )
end

10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hacker.say_something_smart,
    email: Faker::Internet.email,
    age: Faker::Number.between(12, 92),
    city_id: rand((City.first.id)..(City.last.id))
  )
end

20.times do
  gossip = Gossip.create(
    title: Faker::Lorem.word,
    content: Faker::Lorem.paragraph,
    date: Faker::Date.forward(365).to_datetime,
    user_id: rand((User.first.id)..(User.last.id))
  )
end

10.times do
  tag = Tag.create(
    title: Faker::Dessert.flavor
  )
end

for i in ((Tag.first.id)..(Tag.last.id))
  gossip = Gossip.find(i)
  tag = Tag.find(i)
  gossip.tags << tag
end

10.times do
  gossip_id = rand((Gossip.first.id)..(Gossip.last.id))
  tag_id = rand((Tag.first.id)..(Tag.last.id))
  gossip = Gossip.find(gossip_id)
  tag = Tag.find(tag_id)
  gossip.tags << tag
end

1.times do
  private_message = PrivateMessage.create(
    content: Faker::Lorem.paragraph,
    date: Faker::Date.forward(365).to_datetime,
    recipient_id: rand((User.first.id)..(User.last.id)),
    sender_id: rand((User.first.id)..(User.last.id))
  )
end

20.times do
  comment = Comment.create(
    content: Faker::Movie.quote,
    user_id: rand((User.first.id)..(User.last.id)),
    gossip_id: rand((Gossip.first.id)..(Gossip.last.id))
  )
end
