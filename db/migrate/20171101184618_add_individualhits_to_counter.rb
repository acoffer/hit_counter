class AddIndividualhitsToCounter < ActiveRecord::Migration[5.1]
  def change
  	add_column :counters, :individualhits, :integer
  end
end
