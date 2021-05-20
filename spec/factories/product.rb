FactoryBot.define do
  factory :product do
    shipping_charges_id        { 1 }
    product_condition_id       { 1 }
    # activestorageをつかってるから記述方法を訂正。→oooo.jpは不可。
    # image                      {"moon.jp"}
    prefecture_id              { 1 }
    estimated_shipping_date_id { 2 }
    category_id                { 4 }
    name                       { '月' }
    text                       { '月の絵' }
    price                      { 500 }

    # userのfactoryをつなぐ
    association :user

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/earth_image.png'), filename: 'earth_image.png')
    end
  end
end
