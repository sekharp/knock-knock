FactoryBot.define do
  factory :prospect do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "email-#{n}@gmail.com" }
    sequence(:notes) { |n| "Note #{n}" }
    user
  end
end