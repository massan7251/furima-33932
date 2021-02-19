FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'aaa111'}
    password_confirmation {password}
    last_name             {'太郎'}
    first_name            {'てすと'}
    last_name_kana        {'タロウ'}
    first_name_kana       {'テスト'}
    birthday              {'2021-01-13'}
  end
end