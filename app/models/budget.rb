class Budget < ApplicationRecord
  has_one :client, dependent: :destroy
  has_one :project, dependent: :destroy

  has_many :budget_items, dependent: :destroy, inverse_of: :budget

  accepts_nested_attributes_for :client, update_only: true
  accepts_nested_attributes_for :project, update_only: true
  accepts_nested_attributes_for :budget_items, reject_if: :all_blank, allow_destroy: true

  delegate :name, to: :client, prefix: true
  delegate :name, to: :project, prefix: true
end
