# frozen_string_literal: true

# Addressable
module Addresable
  extend ActiveSupport::Concern

  included do
    has_one :address,
            class_name: 'Address',
            foreign_key: 'addressable_id',
            as: :addressable,
            dependent: :destroy

    accepts_nested_attributes_for :address,
                                  reject_if: :all_blank,
                                  allow_destroy: true
  end
end
