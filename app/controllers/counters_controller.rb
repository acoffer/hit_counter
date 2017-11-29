class CountersController < ApplicationController
	skip_before_action :verify_authenticity_token, :if => :counter_js_request?

	def index
		@counters = Counter.all
	end

	def show
		@counter=Counter.find_by(name: params[:id])

		respond_to do |format|
			format.html 
			format.js
		end
	end

	def hit
		@counter=Counter.find(params[:id])
	end

	def destroy_all
		Counter.all.destroy_all
		render :plain => "All counters destroyed"
	end

	private

 	def counter_js_request?
 		request.format.js?
 	end
end
