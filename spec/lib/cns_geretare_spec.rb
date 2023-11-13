require 'rails_helper'
require 'cns_geretare'

RSpec.describe CnsGeretare do
  describe '.gerador_cns' do
    it 'gera um CNS válido' do
      cns = CnsGeretare.gerador_cns
      expect(cns).to match(/^\d{15}$/)
    end
  end

  describe '.gerador_pis' do
    it 'gera um PIS válido' do
      pis = CnsGeretare.gerador_pis
      expect(pis).to match(/^\d{11}$/)
    end
  end

  describe '.validate' do
    it 'retorna true para um CNS válido' do
      cns = CnsGeretare.gerador_cns
      expect(CnsGeretare.validate(cns)).to eq(true)
    end

    it 'retorna false para um CNS inválido' do
      expect(CnsGeretare.validate('123456789012345')).to eq(false)
    end

    it 'retorna false para um CNS com formato inválido' do
      expect(CnsGeretare.validate('123.456.789-012345')).to eq(false)
    end

    it 'retorna false para um CNS com caracteres inválidos' do
      expect(CnsGeretare.validate('A23456789012345')).to eq(false)
    end
  end
end