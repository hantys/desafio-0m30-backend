FactoryBot.define do
  factory :citizen do
    full_name { FFaker::Name.name }
    email { FFaker::Internet.email }
    status { rand(0..1) }
    birth_date { FFaker::Date.birthday(min_age: 20, max_age: 50) }
    document_number { FFaker::IdentificationBR.cpf }
    cns { rand(10**14..10**15 - 1) }
  end
end
