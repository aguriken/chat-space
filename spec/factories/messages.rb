FactoryGirl.define do
  factory :message do
    body      Faker::Lorem.sentence
    # image     Faker::Avator.image
    group
    user
  end
end
