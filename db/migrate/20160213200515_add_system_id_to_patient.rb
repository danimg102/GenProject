class AddSystemIdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :system_id, :integer
  end
end
