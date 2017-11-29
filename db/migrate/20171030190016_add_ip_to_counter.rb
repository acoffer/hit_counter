class AddIpToCounter < ActiveRecord::Migration[5.1]
  def change
  	add_column :counters, :ip, :string
  end
end
