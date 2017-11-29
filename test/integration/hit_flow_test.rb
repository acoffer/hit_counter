require 'test_helper'

class HitFlowTest < ActionDispatch::IntegrationTest
  test "get root and check that it displays the correct message" do
    get '/'
    assert_response :success
    assert_select "p", "There have been  views of this home page."
  end

  test "check that /counters page shows each counter" do
    get '/counters'
    assert_response :success

    assert_select "h3", "All Counter objects:"

    assert_select "th", 5
    assert_select "th", "ID"
    assert_select "th", "Name"
    assert_select "th", "Count"
    assert_select "th", "Created"
    assert_select "th", "Updated"

    assert_select "tr", 4
    assert_select "td", 15
  end

  test "check that /counters/:name can be called as opposed to /counters/:id" do
    get '/counters/somewhere'
    assert_select "h3", "Counter ID: 2"
    assert_select "tr", 2
    assert_select "td", 5
  end

  test "check that local/individual_hits shows the correctly before & after getting root 3 times" do
    get '/counters/local/individual_hits'
    assert_select "h3", "All Individual hits objects:"
    assert_select "tr", 4
    assert_select "td", 15

    for i in 1..3 
      get '/'
      assert_response :success
    end
    get '/counters/local/individual_hits'
    assert_select "h3", "All Individual hits objects:"
    assert_select "tr", 7
    assert_select "td", 30
  end

  test "make sure destroy all page displays correctly" do
    get '/counters/destroy_all'
    assert_response :success
    assert_select "p", "All counters destroyed"
  end
end
