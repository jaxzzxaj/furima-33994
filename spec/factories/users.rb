FactoryBot.define do
  factory :user do
    transit do
      person{Gimei.name}
    end
    nickname             {Faker::Name.name}
    email                {Faker::Internet.email}
    password             {Forgery(:basic).text}
    encrypted_password   {password}
    family_name          {person.first.kanji}
    second_name          {person::last.kanji}
    reader_family_name   {person::first.katakana}
    reader_second_name   {person::last.katakana}
    birthday_year        {Forgery(:date).year}
    birthday_month       {Forgery(:date).month}
    birthday_day         {Forgery(:date).day}
  end
end
