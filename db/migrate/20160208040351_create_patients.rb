class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :code

      t.timestamps
    end
  end
end
