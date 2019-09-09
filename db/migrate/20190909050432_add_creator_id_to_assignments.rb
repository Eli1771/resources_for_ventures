class AddCreatorIdToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :creator_id, :integer
  end
end
