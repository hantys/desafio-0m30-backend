require 'rails_helper'

RSpec.describe Citizen, type: :model do
  context "Creation" do
    it "created citizen" do
      expect { create(:citizen) }.to change(Citizen, :count).by(1)
    end

    it "not created citizen" do
      expect { subject.save }.to change(Citizen, :count).by(0)
      expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "Methods" do
    describe '#delete' do
      it 'sets the status to inactive (0)' do
        citizen = create(:citizen, status: :active)

        expect do
          citizen.delete
          citizen.reload
        end.to change(citizen, :status).from("active").to("inactive")
      end

      it 'does not actually destroy the record' do
        citizen = create(:citizen)

        expect do
          citizen.delete
        end.not_to change(Citizen, :count)
      end
    end

    describe '#destroy' do
      it 'sets the status to inactive (0)' do
        citizen = create(:citizen, status: :active)

        expect do
          citizen.destroy
          citizen.reload
        end.to change(citizen, :status).from("active").to("inactive")
      end

      it 'destroys the record when called with bang (!)' do
        citizen = create(:citizen)

        expect do
          citizen.destroy!
        end.not_to change(Citizen, :count)
      end
    end
  end

  context 'Enum' do
    it {
      is_expected.to define_enum_for(:status)
        .with_values(
          inactive: 0,
          active: 1
        )
        .backed_by_column_of_type(:integer)
    }
  end

  context 'HasOneAttached' do
    it 'check create avatar' do
      citizen = create(:citizen)
      expect(citizen.avatar.attached?).to be(true)
      expect(citizen.avatar.download).to_not be_nil
    end
  end

  context 'Index' do
    it { is_expected.to have_db_index(:full_name) }
    it { is_expected.to have_db_index(:cns) }
    it { is_expected.to have_db_index(:document_number) }
    it { is_expected.to have_db_index(:email) }
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:country_code) }
    it { is_expected.to validate_presence_of(:avatar) }

    describe 'validades for cns' do
      it { is_expected.to validate_presence_of(:cns) }

      context 'quando o CNS é válido' do
        let(:citizen) { build(:citizen, cns: CnsGeretare.gerador_cns) }

        it 'é válido' do
          expect(citizen).to be_valid
        end
      end

      context 'quando o CNS não é válido' do
        let(:citizen) { build(:citizen, cns: 'cns_inválido') }

        it 'não é válido' do
          expect(citizen).not_to be_valid
        end

        it 'tem erro na validação personalizada' do
          citizen.valid?
          expect(citizen.errors[:cns]).to include('não é um CNS válido')
        end
      end
    end

    describe 'validades for phone_number' do
      it { is_expected.to validate_presence_of(:phone_number) }

      it 'valida que o número de telefone está no formato correto' do
        expect(build(:citizen, phone_number: '(86) 99543-3999')).to be_valid
        expect(build(:citizen, phone_number: '(44) 96756-9999')).to be_valid

        expect(build(:citizen, phone_number: '9999999999')).not_to be_valid
        expect(build(:citizen, phone_number: '(99) 999999-9999')).not_to be_valid
        expect(build(:citizen, phone_number: '(99) 999-9999')).not_to be_valid
      end
    end

    describe 'validades for birth_date' do
      it { is_expected.to validate_presence_of(:birth_date) }
      it 'valida que a data de nascimento não pode ser maior que a data atual' do
        citizen = build(:citizen, birth_date: Date.tomorrow)
        expect(citizen).not_to be_valid
        expect(citizen.errors[:birth_date]).to include("não pode ser maior que a data atual")
      end
    end

    describe 'validades for document_number' do
      it { is_expected.to validate_presence_of(:document_number) }
      it { is_expected.to allow_value('123.456.789-01').for(:document_number) }
      it { is_expected.not_to allow_value('123.456.789-0').for(:document_number).with_message('deve estar no formato 123.456.789-01') }
      it { is_expected.not_to allow_value('12345678901').for(:document_number).with_message('deve estar no formato 123.456.789-01') }
    end

    describe 'validades for email' do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to allow_value('user@example.com').for(:email) }
      it { is_expected.not_to allow_value('user@', 'user@example', 'user@.com').for(:email) }
    end
  end

  context 'Associations' do
    it { is_expected.to have_one(:address).dependent(:destroy).class_name('Address').with_foreign_key('addressable_id') }
  end
end
