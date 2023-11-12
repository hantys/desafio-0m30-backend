FactoryBot.define do
  factory :address do
    cep { "MyString" }
    street { "MyString" }
    neighborhood { "MyString" }
    number { "MyString" }
    city { "MyString" }
    state { "MyString" }
    complement { "MyString" }
    ibge { "MyString" }
    addressable { nil }
  end
end
