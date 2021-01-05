class LandlordsController < ApplicationController
    before_action :get_landlord, only: [:show, :edit, :update, :destroy]

    def login
        @error = flash[:error]
    end

    def handle_login
        @landlord = Landlord.find_by(username: params[:username])

        if @landlord && @landlord.authenticate(params[:password])
            redirect_to landlord_path(@landlord)
        else
            flash[:error] = "Incorrect username or password"
            redirect_to landlord_login_path
            # ? Are we going to need separate login paths for renter/landlord??
        end
    end

    def index 
        @landlords = Landlord.all 
    end 

    # we might not need this action thanks to before_action 
    def show 
        @landlord = Landlord.find(params[:id])
    end 

    def new 
        @landlord = Landlord.new 
    end 

    def create
        @landlord = Landlord.create(landlord_params)

        if @landlord.valid?
            redirect_to landlord_path(@landlord)
          
        else 
            flash[:errors] = @landlord.errors.full_messages
            redirect_to new_landlord_path
        end
    end 

    # we might not need this action thanks to before_action 
    def edit 
        @landlord = Landlord.find(params[:id])
    end 

    def update 
        # @landlord = Landlord.find(params[:id])
        @landlord.update(landlord_params)

        redirect_to landlord_path(@landlord)
    end 

    def destroy 
        # @landlord = Landlord.find(params[:id])
        @landlord.destroy 
        # byebug
        redirect_to landlords_path
    end 

    private

    def landlord_params 
        params.require(:landlord).permit(:name, :location, :username, :user_type, :password)
    end 

    def get_landlord 
        @landlord = Landlord.find(params[:id])
    end 

end
