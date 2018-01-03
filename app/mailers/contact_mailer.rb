class ContactMailer < ApplicationMailer
	
	def contact_email(contact)
		@contact=contact
		mail(to: "455b5e4753-9b72f4@inbox.mailtrap.io", subject: 'New contact message')
	end

end
