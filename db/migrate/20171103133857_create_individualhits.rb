class CreateIndividualhits < ActiveRecord::Migration[5.1]
  def change
    create_table :individualhits do |t|
      t.belongs_to :counter, index: true
      t.integer :counter_id

      t.timestamps
    end
  end
end
