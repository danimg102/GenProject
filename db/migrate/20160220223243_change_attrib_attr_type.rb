class ChangeAttribAttrType < ActiveRecord::Migration
  def up
    change_column :attribs, :attr_type, :integer
  end
  def down
    change_column :attribs, :attr_type, :string
  end
end
