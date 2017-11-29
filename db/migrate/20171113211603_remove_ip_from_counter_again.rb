class RemoveIpFromCounterAgain < ActiveRecord::Migration[5.1]
  def change
  	remove_column :counters, :ip, :string
  end
end
