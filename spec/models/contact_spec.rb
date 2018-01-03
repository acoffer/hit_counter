require 'rails_helper'

RSpec.describe Contact, type: :model do
	it "is valid with valid attributes" do
		contact = Contact.new(ip: "000.000.000.999", name: "any name", email: "email@address", content: "any random text")
		expect(contact).to be_valid
	end

	it "is not valid if blank" do
		contact = Contact.new
		expect(contact).to_not be_valid
	end

	it "is not valid without an ip" do
		contact = Contact.new(ip: nil, name: "any name", email: "email@address", content: "any random text")
		expect(contact).to_not be_valid
	end

	it "is not valid when doesn't have ip address format" do
		contact = Contact.new(ip: "a.000.000.999", name: "any name", email: "email@address", content: "any random text")
		expect(contact).to_not be_valid
	end

	it "is not valid without a name" do
		contact = Contact.new(ip: "000.000.000.999", name: nil, email: "email@address", content: "any random text")
		expect(contact).to_not be_valid
	end

	it "is not valid without an email" do
		contact = Contact.new(ip: "000.000.000.999", name: "any name", email: nil, content: "any random text")
		expect(contact).to_not be_valid
	end

	it "is not valid without if email doesn't have an @ symbol" do
		contact = Contact.new(ip: "000.000.000.999", name: "any name", email: "emailaddress", content: "any random text")
		expect(contact).to_not be_valid
	end

	it "is not valid without content" do
		contact = Contact.new(ip: "000.000.000.999", name: "any name", email: "email@address", content: nil)
		expect(contact).to_not be_valid
	end

end
