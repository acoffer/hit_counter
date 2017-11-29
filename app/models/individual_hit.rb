class IndividualHit < ApplicationRecord
	belongs_to :counter

	validates :ip, presence: true
	validates :ip, format: {with: /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/}
end
