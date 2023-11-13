require 'rails_helper'

RSpec.describe Address, type: :model do
  context "Creation" do
    it "created address" do
      expect { create(:address) }.to change(Address, :count).by(1)
    end

    it "not created address" do
      expect { subject.save }.to change(Address, :count).by(0)
      expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }

    describe 'validades for cep' do
      it { is_expected.to validate_presence_of(:cep) }
      it { should allow_value("12345-678").for(:cep) }
      it { should_not allow_values("1234-567", "12345678", "12345_678", "abcde-fghi").for(:cep).with_message("deve estar no formato 12345-678") }
    end
  end

  context 'Associations' do
    it { is_expected.to belong_to(:addressable).optional }
  end
end
