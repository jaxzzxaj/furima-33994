FactoryBot.define do
  factory :perchase_order do
    zip_code              { '123-1234' }
    prefecture_id         { 1 }
    municipality          { '入間市' }
    adress                { '2番地' }
    phone_number          { '09012341234' }
    token                 { 'tok_abcdefghijk00000000000000000' }
    # product               { FactoryBot.create(:user) }

    # purchase_historyを使ってuserとproductのfactoryとつなぐ
    # association :user, :product
    # association :purchase_history
  end
end
