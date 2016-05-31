class ReviewsController < ApplicationController
before_action :authenticate_user!, only: [:create, :destroy]


def create
	@review = current_user.reviews.build(review_params)
	
	if @review.save
		redirect_to current_user
		puts "yes"
	else
		redirect_to current_user
		puts "no"
	end
end

def destroy
end

private

	def review_params
		params.require(:review).permit(:content, :score)
	end

end