class AddRulesToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :rules, :text
  end
end
