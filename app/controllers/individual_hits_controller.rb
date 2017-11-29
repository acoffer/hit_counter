class IndividualHitsController < ApplicationController
	def index
		@individual_hits=Counter.find_by(name: params[:counter_id]).individual_hits
	end
end