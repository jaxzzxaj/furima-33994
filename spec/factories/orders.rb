FactoryBot.define do
  factory :order do
    zip_code              { Faker::Address.zip_code }
    prefecture_id         { 1 }
    municipality          { '入間市' }
    adress                { '2番地' }
    phone_number          { 12345678912 }
    # product               { FactoryBot.create(:user) }

    # purchase_historyを使ってuserとproductのfactoryとつなぐ
    # association :user, :product
    association :purchase_history
  end
end
