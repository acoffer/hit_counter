require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
  	get root_url
  	assert_response :success
  end

  test "checks to make sure data base is counting correctly" do
  	assert_equal(Counter.count, 3)

    @local_counter=Counter.find_by(id: '2')
    @display_local_hits=@local_counter.individual_hits.count
    assert_equal(@display_local_hits, 2)

    @local_counter=Counter.find_by(id: '74')
    @display_local_hits=@local_counter.individual_hits.count
    assert_equal(@display_local_hits, 3)

    @new_counter=Counter.create(name: '4')
    @new_individual_hit=IndividualHit.create(ip: '22.22.22.22', counter: @new_counter)
    assert_equal(@new_counter.individual_hits.count, 1)
    assert_equal(Counter.count, 4)
    assert_equal(IndividualHit.count, 6)
  end

  # test "the truth" do
  #   assert true
  # end
end
