class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.string :send_date
      t.float :total_amount
      t.string :estimated_time

      t.timestamps
    end
  end
end
