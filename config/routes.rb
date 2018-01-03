Rails.application.routes.draw do
	root 'welcome#front'

	resources :contacts, :only => [:new, :create]
	
	resources :counters, :only => [:index, :show] do
		
		member do
			get :hit
		end

		resources :individual_hits, :only => [:index]
		
		collection do
			get :destroy_all
		end
	end
end
