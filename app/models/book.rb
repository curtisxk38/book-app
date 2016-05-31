class Book < ActiveRecord::Base
	validates :author, presence: true
	validates :title, presence: true
	has_many :reviews

	def self.search(search, type)
		where("#{type} LIKE ?", "%#{search}%")
	end

	def feed
		Review.where("book_id = ?", id)
	end
end
