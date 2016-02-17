class RemoveSystemIdFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :system_id
  end
end
