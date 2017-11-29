require 'test_helper'

class CountersControllerTest < ActionDispatch::IntegrationTest
	test "make sure show page is counting each hit" do
		@local_counter=Counter.find_by(id: '74')
    	@display_local_hits=@local_counter.individual_hits.count
    	assert_equal(@display_local_hits, 3)

    	@new_local_hit=IndividualHit.create(ip: "127.0.0.1", counter: @local_counter)
    	@new_display_local_hits=@local_counter.individual_hits.count
    	assert_equal(@new_display_local_hits, 4)
	end
end