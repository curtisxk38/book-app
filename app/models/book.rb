class Book < ActiveRecord::Base
	validates :author, presence: true
	validates :title, presence: true

	def self.search(search, type)
		where("#{type} LIKE ?", "%#{search}%")
	end
end
