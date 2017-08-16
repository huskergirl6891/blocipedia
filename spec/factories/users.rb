FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user#{n}@factory.com" }
    password 'helloworld'
    password_confirmation 'helloworld'
  end
end
