class MoveIpDataToIndividualHits < ActiveRecord::Migration[5.1]
  def change
  	IndividualHit.find_each do |individual_hit|
  		counter = Counter.find(individual_hit.counter_id)
  		individual_hit.ip=counter.ip
  	end
  end
end
