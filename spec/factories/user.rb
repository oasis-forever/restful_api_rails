FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'sample@example.com' }
    password { 'hogehogefoobar' }
  end
end
