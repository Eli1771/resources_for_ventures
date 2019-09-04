class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.integer :material_id
      t.integer :student_id
      t.boolean :mark_as_viewed

      t.timestamps
    end
  end
end
