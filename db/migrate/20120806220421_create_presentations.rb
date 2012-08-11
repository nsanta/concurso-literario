class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.references :user
      t.string :asset

      t.timestamps
    end
  end
end
