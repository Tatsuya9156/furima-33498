FactoryBot.define do
  factory :order_address do
    token         { "tok_abcdefghijk00000000000000000" }
    zip           { "123-4567" }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city          { Gimei.city.kanji }
    block         { "青山1-2-3"}
    phone         { Faker::Number.number(digits: 11) }
  end
end
