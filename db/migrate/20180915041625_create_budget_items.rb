class CreateBudgetItems < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_items do |t|
      t.string :description
      t.references :budget, foreign_key: true

      t.timestamps
    end
  end
end
