class ReviewsController < ApplicationController

    def new
        @review = Review.new
    end

    def create
        @review = Review.create(review_params)
    end

    # def edit 
    #     # @renter = Renter.find(params[:id])
    #     @review = @current_renter
    # end 

    # def update 
    #     @review.update(review_params)

    #     redirect_to landlord_path(@review.landlord_id)
    # end 

    # def destroy
    #     @review = Review.find(params[:id])
    #     @review.destroy 

    #     redirect_to renters_path
    # end 

    private

    def review_params
        params.require(:review).permit(:renter_id, :landlord_id, :rating, :comment)
    end

end
