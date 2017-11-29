class RemoveIndividualhitsFromCounter < ActiveRecord::Migration[5.1]
  def change
  	remove_column :counters, :individualhits, :integer
  end
end

