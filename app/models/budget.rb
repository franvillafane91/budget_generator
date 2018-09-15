class Budget < ApplicationRecord
  has_one :client, dependent: :destroy
  has_one :project, dependent: :destroy

  accepts_nested_attributes_for :client, update_only: true
  accepts_nested_attributes_for :project, update_only: true

  delegate :name, to: :client, prefix: true
  delegate :name, to: :project, prefix: true
end
