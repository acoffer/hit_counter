class AssureIndividualIsAssociated < ActiveRecord::Migration[5.1]
  def change
  	counter_73=Counter.find(73)
  	IndividualHit.find_each do |individual_hit_specific|
  		counter_73.update(individual_hits: [individual_hit_specific])
  	end

  end
end
