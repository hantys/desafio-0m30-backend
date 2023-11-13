class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true

  # Validações
  validates :cep, presence: true, format: { with: /\A\d{5}-\d{3}\z/, message: "deve estar no formato 12345-678" }
  validates :street, presence: true
  validates :neighborhood, presence: true
  validates :number, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ["addressable_id", "addressable_type", "cep", "city", "complement", "created_at", "ibge", "id", "id_value", "neighborhood", "number", "state", "street", "updated_at"]
  end

  def self.ransackable_associations(_auth_object = nil)
    ["addressable"]
  end
end
