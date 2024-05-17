FactoryBot.define do
  factory :order do
    association :user
    association :product
  end
end
