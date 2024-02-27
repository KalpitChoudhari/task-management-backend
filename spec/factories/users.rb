FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password123' } # Adjust as needed
    password_confirmation { 'password123' } # Adjust as needed
  end
end
