FactoryBot.define do
  factory :address do
    cep { FFaker::AddressBR.zip_code }
    street { FFaker::AddressBR.street }
    neighborhood { FFaker::AddressBR.neighborhood }
    number { FFaker::AddressBR.building_number }
    city { FFaker::AddressBR.city }
    state { FFaker::AddressBR.state_abbr }
    complement { FFaker::AddressBR.complement }
    ibge { nil }
  end
end
