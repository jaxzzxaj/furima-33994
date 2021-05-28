FactoryBot.define do
  factory :purchase_history do
    association :user, :product
  end
end
