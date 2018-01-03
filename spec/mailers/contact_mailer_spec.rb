require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do

	describe "contact_email" do  
		let(:contact) {Contact.new(ip: "7.7.7.7", name: "name_test", email: "test@odu", content: "some long messages for testing this should say stuff")}

		subject(:email) {ContactMailer.contact_email(contact)}

		it "delivers to contact message to mailtrap" do
  			expect(email).to deliver_to("455b5e4753-9b72f4@inbox.mailtrap.io")
  		end

  		it "has a subject"  do
  			expect(email).to have_subject(/New contact message/)
  		end

  		it "contains the contents of contact" do
  			expect(email).to have_body_text(/some long messages for testing this should say stuff/)
  		end

  		it "has a header" do
  			expect(email).to have_header(/name_test/)
  		end
	end

end
