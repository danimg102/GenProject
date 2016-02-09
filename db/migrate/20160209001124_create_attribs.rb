class CreateAttribs < ActiveRecord::Migration
  def change
    create_table :attribs do |t|
      t.integer :system_id
      t.string :name
      t.string :type
      t.string :extra

      t.timestamps
    end
  end
end
