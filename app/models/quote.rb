class Quote < ApplicationRecord
	validates :quote, presence: true
	validates :url, presence:true
end
