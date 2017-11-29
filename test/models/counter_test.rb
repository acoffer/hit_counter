require 'test_helper'

class CounterTest < ActiveSupport::TestCase
 	
 	test "test validility of name can't be nill" do
 		@counter=Counter.create
 		assert !@counter.valid?
 	end

 	test "test validility of name must be unique" do
 		@counter1=Counter.create(name: "tom's")
 		@counter2=Counter.create(name: "tom's")
 		assert !@counter2.valid?
 	end
end
