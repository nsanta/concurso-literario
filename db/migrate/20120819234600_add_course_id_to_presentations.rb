class AddCourseIdToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :course_id, :integer
  end
end
