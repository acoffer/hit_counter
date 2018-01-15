# Don't care if the mailer can't send.
  ActionMailer::Base.raise_delivery_errors = true

  ActionMailer::Base.perform_caching = false

  if Rails.env.test?
    ActionMailer::Base.delivery_method = :test
    
  elsif Rails.env.development?
    ActionMailer::Base.delivery_method = :smtp
  
    ActionMailer::Base.smtp_settings = {
      #method 1
      #Hide Username and Password in local Enviroment Variable, set up with "environment_variables.yml"
      # :user_name => ENV["MAILTRAP_USERNAME"],
      # :password => ENV["MAILTRAP_PASSWORD"],
      
      #method 2
      #Hide Username and Password in a model named Configuration, database .sqlite3 is not uploaded
      :user_name => Configuration.find_by!(name: "MAILTRAP_USERNAME").value,
      :password => Configuration.find_by!(name: "MAILTRAP_PASSWORD").value,

      #method 3
      #Hide Username and Password in secret.yml and don't upload secret.yml to repository    
      #:user_name => Rails.application.secrets.mailtrap_username,
      #:password => Rails.application.secrets.mailtrap_password,

      :address => 'smtp.mailtrap.io',
      :domain => 'smtp.mailtrap.io',
      :port => '2525',
      :authentication => :cram_md5
    }
  end