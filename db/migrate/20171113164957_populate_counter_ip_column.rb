class PopulateCounterIpColumn < ActiveRecord::Migration[5.1]
  def change
  	Counter.find_each do |counter|
  		counter.ip = "127.0.0.1"
  	end
  end
end
