FactoryBot.define do
  factory :citizen do
    full_name { FFaker::Name.name }
    email { FFaker::Internet.email }
    status { Citizen.statuses.keys.sample }
    birth_date { FFaker::Date.birthday(min_age: 20, max_age: 50) }
    document_number { FFaker::IdentificationBR.pretty_cpf }
    phone_number { FFaker::PhoneNumberBR.mobile_phone_number }
    cns { CnsGeretare.gerador_cns }
    avatar { Rack::Test::UploadedFile.new("public/teste.jpg", "image/jpeg") }
    address
  end
end
