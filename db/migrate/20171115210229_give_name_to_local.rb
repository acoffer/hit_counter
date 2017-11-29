class GiveNameToLocal < ActiveRecord::Migration[5.1]
  def change
  	counter=Counter.find(74)
  	counter.name="Local"
  	counter.save
  end
end
