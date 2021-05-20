FactoryBot.define do
  factory :user do
    nickname             { 'ヤマタロウ' }
    email                { Faker::Internet.email }
    password             { 'password1' }
    encrypted_password   { 'password1' }
    family_name          { '山田' }
    second_name          { '太郎' }
    reader_family_name   { 'ヤマダ' }
    reader_second_name   { 'タロウ' }
    birthday             { '1940-01-01' }
  end
end
