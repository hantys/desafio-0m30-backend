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

  context 'Index' do
    it { is_expected.to have_db_index(:full_name) }
    it { is_expected.to have_db_index(:cns) }
    it { is_expected.to have_db_index(:document_number) }
    it { is_expected.to have_db_index(:email) }
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:document_number) }
    it { is_expected.to validate_presence_of(:cns) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:birth_date) }
  end
end
