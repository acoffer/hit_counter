class AddNameToCounter < ActiveRecord::Migration[5.1]
  def change
  	add_column :counters, :name, :string
  end
end
