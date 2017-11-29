class MoveIpDataToIndividualHitsAgain < ActiveRecord::Migration[5.1]
  def change
  	IndividualHit.find_each do |individual_hit|
  		@counter=Counter.find_by(id: individual_hit.counter_id)
  		individual_hit.ip=@counter.ip
  		individual_hit.save
  	end
  end
end
