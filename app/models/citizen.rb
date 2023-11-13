class Citizen < ApplicationRecord
  ## ATTRIBUTES
  attr_accessor :remove_avatar

  ## CONCERNS
  include Addresable

  # Enuns
  enum status: { active: 1, inactive: 0 }

  # Validações
  validates :full_name, presence: true
  validates :document_number, presence: true, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: "deve estar no formato 123.456.789-01" }
  validates :cns, presence: true, format: { with: /\A\d{15}\z/ }
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\.[a-zA-Z]{2,}\z/ }
  validates :birth_date, presence: true
  validates :avatar, presence: true
  validates :country_code, presence: true
  validates :phone_number, presence: true, phony_plausible: { normalized_country_code: 'BR' }
  validates :address, presence: true

  validate :birth_date_cannot_be_in_the_future
  validate :cns_must_be_valid

  ## ACTIVE STORAGE
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [90, 90]
    attachable.variant :medium, resize_to_limit: [160, 160]
  end

  ## ASSOCIATIONS
  delegate :cep,
           :street,
           :neighborhood,
           :number,
           :city,
           :state,
           :complement,
           :ibge, to: :address, allow_nil: true

  ## CALLBACKS
  after_save :purge_avatar, if: -> { remove_avatar == '1' }

  # Metodos
  def full_address
    "
    <p>
    #{street}, #{number} - #{neighborhood} <br>
    #{complement}
    </p>
    #{city}-#{state} /
    #{cep}
      <br>
      IGBE:#{ibge}
    ".html_safe
  end

  # Sobrescreva o método 'delete' para definir o status como 0
  def delete
    value = status == 'inactive' ? 1 : 0
    update_attribute(:status, value)
  end

  # Sobrescreva o método 'destroy' para definir o status como 0
  def destroy
    value = status == 'inactive' ? 1 : 0
    update_attribute(:status, value)
  end

  def self.ransackable_attributes(_auth_object = nil)
    [
      "cns", "document_number",
      "email",
      "full_name", "id", "status",
      'addressable_cep'
    ]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['addressable', 'address']
  end

  private

  def purge_avatar
    avatar.purge_later
  end

  def birth_date_cannot_be_in_the_future
    return if birth_date.blank?

    return unless birth_date > Date.today

    errors.add(:birth_date, "não pode ser maior que a data atual")
  end

  def cns_must_be_valid
    return if CnsGeretare.validate(cns)

    errors.add(:cns, 'não é um CNS válido')
  end
end
