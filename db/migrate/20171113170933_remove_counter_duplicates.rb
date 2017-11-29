class RemoveCounterDuplicates < ActiveRecord::Migration[5.1]
  def change
  	Counter.find_each do |counter|
  		unless counter.id == 73
  			counter.destroy
  		end
  	end
  end
end
