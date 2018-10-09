class AddMissingInfoFieldToBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :show_missing_info_clarification, :boolean
  end
end
