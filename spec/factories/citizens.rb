FactoryBot.define do
  factory :citizen do
    full_nome { Faker::Name.name }
    email { Faker::Internet.email }
    status { rand(0..1) }
    birth_date { Faker::Date.birthday(min_age: 20, max_age: 50) }
    document_number { Faker::CPF.number }
    cns { rand(10**14..10**15 - 1) }
  end
end
