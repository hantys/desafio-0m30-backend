class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true

  # Validações
  validates :cep, presence: true
  validates :street, presence: true
  validates :neighborhood, presence: true
  validates :number, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
