class AddDevRefToBudget < ActiveRecord::Migration[5.2]
  def change
    add_reference :budgets, :developer, foreign_key: true
  end
end
