class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :course_id
      t.boolean :is_teacher

      t.timestamps
    end
  end
end
