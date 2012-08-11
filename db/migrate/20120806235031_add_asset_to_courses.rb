class AddAssetToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :asset, :string
  end
end
