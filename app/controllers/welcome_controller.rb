class WelcomeController < ApplicationController

	def front
		@ip = request.remote_ip
		if !IndividualHit.exists?(:ip => @ip)
			@counter=Counter.create(name: @ip)
			@individual_hit=IndividualHit.create(ip: @ip, counter: @counter)
		elsif IndividualHit.exists?(:ip => @ip)
			@counter_id=IndividualHit.find_by(:ip => @ip).counter_id
			@counter=Counter.find(@counter_id)
			@individaul_hit=IndividualHit.create(ip: @ip, counter: @counter)
		end
		@display_count=Counter.count
		@display_74_counter=Counter.find(74).individual_hits.count
	end
end
