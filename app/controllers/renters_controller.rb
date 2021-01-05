class RentersController < ApplicationController

    # def login
    #     @error = flash[:error]
    # end

    # def handle_login
    #     @renter = Renter.find_by(username: params[:username])

    #     if @renter && @renter.authenticate(params[:password])
    #         redirect_to renter_path(@renter)
    #     else
    #         flash[:error] = "Incorrect username or password"
    #         redirect_to login_path
    #         # ? Are we going to need separate login paths for renter/landlord??
    #     end
    # end

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
