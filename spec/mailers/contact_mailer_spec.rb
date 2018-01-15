RSpec.describe ContactMailer, type: :mailer do

	describe "contact_email" do  
		let(:contact) {Contact.new(ip: "7.7.7.7", name: "name_test", email: "test@odu", content: "some long messages for testing this should say stuff")}

		subject(:mail) {ContactMailer.contact_email(contact)}

  		it "renders the email header"  do
  			expect(mail.subject).to eq("New contact message")
        expect(mail.to).to eq(["455b5e4753-9b72f4@inbox.mailtrap.io"])
        expect(mail.from).to eq(["test@odu"])
  		end

  		it "renders the body" do
  			expect(mail.body.encoded).to match("some long messages for testing this should say stuff")
  		end

      it "sends an email" do
        expect{ContactMailer.contact_email(contact).deliver_now}.to change{ActionMailer::Base.deliveries.count}.by(1)
      end
	end
end
