FactoryGirl.define do
  factory :message do
    body      Faker::Lorem.sentence
    image     Faker::Avatar.image
    group
    user
  end
end
