class ReviewsController < ApplicationController

    def new
        @review = Review.new
        @landlords = Landlord.all
    end

    def create 
        @current_renter.reviews << Review.create(review_params)
    

        redirect_to landlord_path(@current_renter.reviews.last.landlord_id)
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
        params.require(:review).permit(:landlord_id,:rating, :comment)
    end

end
