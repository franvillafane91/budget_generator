class Budget < ApplicationRecord
  has_one :client

  accepts_nested_attributes_for :client, update_only: true

  delegate :name, to: :client, prefix: true
end
