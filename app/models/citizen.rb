class Citizen < ApplicationRecord
  # Enuns
  enum status: { active: 1, inactive: 0 }

  # Validações
  validates :full_name, presence: true
  validates :document_number, presence: true
  validates :cns, presence: true
  validates :email, presence: true
  validates :status, presence: true
  validates :birth_date, presence: true

  # Metodos
  # Sobrescreva o método `delete` para definir o status como 0
  def delete
    update_attribute(:status, 0)
  end

  # Sobrescreva o método `destroy` para definir o status como 0
  def destroy
    update_attribute(:status, 0)
  end
end
