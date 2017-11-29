class RemoveCountFromCounter < ActiveRecord::Migration[5.1]
  def change
    remove_column :counters, :count, :integer
  end
end
