class RenameValues < ActiveRecord::Migration
  def change
    rename_table :values, :attvalues
  end
end
