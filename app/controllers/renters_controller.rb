class RentersController < ApplicationController

    def index 
        @renters = Renter.all 
    end 

    def show 
        @renter = Renter.find(params[:id])

        # @lease = Lease.find(params[:id])    
    end 

    def new 
        @renter = Renter.new 
    end 

    def create
        renter = Renter.create(renter_params)

        redirect_to renter_path(renter)
    end 

    def edit 
        @renter = Renter.find(params[:id])
    end 

    def update 
        @renter = Renter.find(params[:id])
        @renter.update(renter_params)

        redirect_to renter_path(@renter)
    end 

    def destroy
        @renter = Renter.find(params[:id])
        @renter.destroy 

        redirect_to renters_path
    end 


    private

    def renter_params 
        params.require(:renter).permit(:name, :age, :credit_score)
    end 
end
