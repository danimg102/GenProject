class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :nomenclator_id
      t.string :value
      t.text :description

      t.timestamps
    end
  end
end
