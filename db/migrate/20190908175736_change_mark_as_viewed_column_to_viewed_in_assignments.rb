class ChangeMarkAsViewedColumnToViewedInAssignments < ActiveRecord::Migration[5.2]
  def change
    rename_column :assignments, :mark_as_viewed, :viewed
  end
end
