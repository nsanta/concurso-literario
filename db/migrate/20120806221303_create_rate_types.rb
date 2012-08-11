class CreateRateTypes < ActiveRecord::Migration
  def change
    create_table :rate_types do |t|
      t.string :title
      t.references :course

      t.timestamps
    end
    add_index :rate_types, :course_id
  end
end
