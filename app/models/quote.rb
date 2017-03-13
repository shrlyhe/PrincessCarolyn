class Quote < ApplicationRecord
	validates :quote, presence: true
	validates :url, presence:true

	def self.search(search)
		where("quote ILIKE ?", "%#{search}%")
	end
end
