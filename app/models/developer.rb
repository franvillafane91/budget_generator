class Developer < ApplicationRecord
  has_many :budgets

  validates :email, :name, presence: true
end
