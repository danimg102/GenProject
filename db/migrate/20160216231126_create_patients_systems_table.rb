class CreatePatientsSystemsTable < ActiveRecord::Migration
  def change
    create_table :patients_systems, :id => false do |t|
      t.references :patient
      t.references :system
    end
  end
  def self.down
    drop_table :patients_systems
  end
end
