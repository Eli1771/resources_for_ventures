class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :description
      t.string :url
      t.integer :course_id

      t.timestamps
    end
  end
end
