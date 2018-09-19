class AddTitleFieldToBudgetItem < ActiveRecord::Migration[5.2]
  def change
    add_column :budget_items, :title, :string
  end
end
