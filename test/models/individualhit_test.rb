require 'test_helper'

class IndividualhitTest < ActiveSupport::TestCase
  test "test validilty of ip, can't be nil" do
  	@individual_hit=IndividualHit.create
  	assert !@individual_hit.valid?
  end

  test "test validiity of ip, format" do
  	@counter1=Counter.create(name: "name1")
  	@individual_hit1=IndividualHit.create(ip: "1.1.1.1", counter: @counter1)
  	assert @individual_hit1.valid?
	
	@counter2=Counter.create(name: "name2")
	@individual_hit2=IndividualHit.create(ip: "123.99.0.000", counter: @counter2)
  	assert @individual_hit2.valid?

  	@counter3=Counter.create(name: "name3")
  	@individual_hit3=IndividualHit.create(ip: "1.9994.2.1", counter: @counter3)
  	assert !@individual_hit3.valid?

  	@counter4=Counter.create(name: "name4")
  	@individual_hit4=IndividualHit.create(ip: "1.999.a.1", counter: @counter4)
  	assert !@individual_hit4.valid?
  end


  # test "the truth" do
  #   assert true
  # end
end
