class CreateHourRates < ActiveRecord::Migration[5.2]
  def change
    create_table :hour_rates do |t|
      t.references :budget, foreign_key: true
      t.float :in_pesos
      t.float :in_dolars

      t.timestamps
    end
  end
end
