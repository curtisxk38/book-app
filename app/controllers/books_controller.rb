class BooksController < ApplicationController
	def index
		@books = Book.all 
		# Patching all Listing
		if params[:search]
			@books = Book.search(params[:earch], params[:type])
		else
			@books = Book.all
		end
	end

	def show
		@book = Book.find(params[:id])
		@reviews = @book.reviews
		@review = current_user.reviews.build if user_signed_in?
	end


	def new
		@book = Book.new
	end

	def create
	    @book = Book.new(book_params)
	    if @book.save
	    	redirect_to @book
	    else
	    	render 'new'
	    end
	end

	private

		def book_params
	    	params.require(:book).permit(:author, :title)
    	end
end