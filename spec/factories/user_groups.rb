FactoryGirl.define do
  factory :user_group do
    user        Faker::Number.number(1)
    group       Faker::Number.number(1)
  end
end

