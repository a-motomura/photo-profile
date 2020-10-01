FactoryBot.define do
  factory :tweet do
    name               { Faker::Lorem.characters(number: 8) }
    genre_id           { 1 }
    introduction       { Faker::Lorem.characters(number: 10) }
    place              { Faker::Lorem.characters(number: 10) }
    other              { Faker::Lorem.characters(number: 10) }
    association :user
  end
end
