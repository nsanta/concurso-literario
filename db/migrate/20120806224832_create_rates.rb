class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references :user
      t.float :value
      t.references :presentation

      t.timestamps
    end
    add_index :rates, :user_id
    add_index :rates, :presentation_id
  end
end
