class DeleteFirstCounter < ActiveRecord::Migration[5.1]
  def change
  	Counter.find(73).destroy
  end
end
