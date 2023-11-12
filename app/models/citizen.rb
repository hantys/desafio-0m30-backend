class Citizen < ApplicationRecord
  ## ATTRIBUTES
  attr_accessor :remove_avatar

  # Enuns
  enum status: { active: 1, inactive: 0 }

  # Validações
  validates :full_name, presence: true
  validates :document_number, presence: true
  validates :cns, presence: true
  validates :email, presence: true
  validates :status, presence: true
  validates :birth_date, presence: true
  validates :avatar, presence: true
  validates :country_code, presence: true
  validates :phone_number, presence: true

  ## ACTIVE STORAGE
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [90, 90]
    attachable.variant :medium, resize_to_limit: [160, 160]
  end

  ## ASSOCIATIONS

  ## CALLBACKS
  after_save :purge_avatar, if: -> { remove_avatar == '1' }

  # Metodos
  # Sobrescreva o método 'delete' para definir o status como 0
  def delete
    update_attribute(:status, 0)
  end

  # Sobrescreva o método 'destroy' para definir o status como 0
  def destroy
    update_attribute(:status, 0)
  end

  def self.ransackable_attributes(_auth_object = nil)
    ["cns", "document_number", "email", "full_name", "id", "status"]
  end

  private

  def purge_avatar
    avatar.purge_later
  end
end
