FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { "password" }

    factory :user_with_prospects do
      transient do
        prospect_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:prospect, evaluator.prospects_count, user: user)
      end
    end
  end
end