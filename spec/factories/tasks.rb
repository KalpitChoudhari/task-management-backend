FactoryBot.define do
  factory :task do
    user
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    color { Faker::Color.hex_color }
    status { %w(todo in_progress completed).sample }
  end
end
