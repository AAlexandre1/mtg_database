FactoryBot.define do
  factory :player do
    username {Faker::Internet.username}
  end
end

# username { Faker::Internet.username }
# password { 'password' }
# password_confirmation { 'password' }