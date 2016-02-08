class CreateNomenclators < ActiveRecord::Migration
  def change
    create_table :nomenclators do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
