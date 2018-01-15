Recaptcha.configure do |config|

	config.site_key = Configuration.find_by(name: "recaptcha_site_key").value
	config.secret_key = Configuration.find_by(name: "recaptcha_secret_key").value

end