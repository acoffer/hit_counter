require 'rails_helper'
require 'spec_helper'

RSpec.feature 'Contact email', :type => :feature do
	scenario "User creates a contact email" do
		visit "/contacts/new"

		number_of_contacts=Contact.count

		fill_in "Name", :with => "John Doe"
		fill_in "Email", :with => "John@email"
		fill_in "Content", :with => "some message"
		click_button "Create Contact"


		expect(Contact.count).to eq(number_of_contacts + 1)
		expect(page).to  have_current_path "/"
	end
end
	
