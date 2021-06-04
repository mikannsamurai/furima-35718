FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name_full_width { '山田' }
    last_name_full_width  { '太郎' }
    first_name_katakana   { 'ヤマダ' }
    last_name_katakana    { 'タロウ' }
    birthday              { Faker::Date.between(from: '1930/01/01', to: '2015/12/31') }
  end
end
