FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    done { false }
    todo_id { nil }
  end
end
