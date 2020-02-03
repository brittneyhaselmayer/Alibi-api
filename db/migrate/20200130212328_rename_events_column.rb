class RenameEventsColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :type, :occasion
  end
end
