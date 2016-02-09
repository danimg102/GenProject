class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.integer :attrib_id
      t.string :value
      t.integer :patient_id

      t.timestamps
    end
  end
end
