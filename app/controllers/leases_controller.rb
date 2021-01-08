class LeasesController < ApplicationController

    def show 
        @lease = Lease.find(params[:id])

        # @renter = Renter.find(params[:id])
        # @landlord = Landlord.find(params[:id])
    end 

    def new 
        @lease = Lease.new
        @landlords = Landlord.all 
    end 

    def create 
        @current_renter.leases << Lease.create(lease_params)
    

        redirect_to renter_path(@current_renter)
    end

    private 

    def lease_params 
        params.require(:lease).permit(:landlord_id, :location)
    end 

end
