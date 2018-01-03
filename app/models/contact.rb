class Contact < ApplicationRecord
	validates :ip, presence: true
	validates :ip, format: {with: /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/}

	validates :name, presence: true

	validates :email, presence: true
	validates :email, format: {with: /@/}

	validates :content, presence: true
end
