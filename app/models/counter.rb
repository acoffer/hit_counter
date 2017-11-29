class Counter < ApplicationRecord
	has_many :individual_hits, dependent: :destroy
	
	validates :name, presence: true
	validates :name, uniqueness: true

	validates_associated :individual_hits

	def count
		individual_hits.collect(&:ip).uniq.count
	end
end
