class RentersController < ApplicationController
    before_action :get_renter, only: [:show, :edit, :update, :destroy]

    def login
        @error = flash[:error]
    end

    def handle_login
        @renter = Renter.find_by(username: params[:username])

        if @renter && @renter.authenticate(params[:password])
            redirect_to renter_path(@renter)
        else
            flash[:error] = "Incorrect username or password"
            redirect_to login_path
            # ? Are we going to need separate login paths for renter/landlord??
        end
    end

    def index 
        @renters = Renter.all 
    end 

    # we might not need this action thanks to before_action 
    # def show 
    #     @landlord = Landlord.find(params[:id])
    # end 

    def new 
        @renter = Renter.new 
    end 

    def create
        @renter = Renter.create(renter_params)

        if @renter.valid?
            redirect_to renters_path
          
        else 
            flash[:errors] = @renter.errors.full_messages
            redirect_to new_renter_path
        end
    end 

     # we might not need this action thanks to before_action 
    def edit 
        @renter = Renter.find(params[:id])
    end 

    def update 
        # @renter = Renter.find(params[:id])
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
        params.require(:renter).permit(:name, :age, :username, :user_type, :password)
    end 

    def get_renter
        @renter = Renter.find(params[:id])
    end 
end
