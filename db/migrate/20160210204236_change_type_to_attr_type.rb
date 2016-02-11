class ChangeTypeToAttrType < ActiveRecord::Migration
  def change
    rename_column :attribs, :type, :attr_type
  end
end
