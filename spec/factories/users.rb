FactoryGirl.define do
  sample_password = Faker::Internet.password(8)

  factory :user do
    name                      Faker::Name.name
    email                     Faker::Internet.email
    password                  sample_password
    password_confirmation     sample_password

    after(:create) do |user|
      tmp_group = create(:group)
      create(:user_group, user: user, group: tmp_group)
      create(:message, user: user, group: tmp_group)
    end
  end
end
