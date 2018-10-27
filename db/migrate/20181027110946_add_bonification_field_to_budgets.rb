class AddBonificationFieldToBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :bonification, :float
  end
end
