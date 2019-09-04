class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :password-digest
      t.integer :course_level

      t.timestamps
    end
  end
end
