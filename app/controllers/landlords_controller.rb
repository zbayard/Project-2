class LandlordsController < ApplicationController


    # def login
    #     @error = flash[:error]
    # end

    # def handle_login
    #     @landlord = Landlord.find_by(username: params[:username])

    #     if @landlord && @landlord.authenticate(params[:password])
    #         redirect_to landlord_path(@landlord)
    #     else
    #         flash[:error] = "Incorrect username or password"
    #         redirect_to login_path
    #         # ? Are we going to need separate login paths for renter/landlord??
    #     end
    # end

    def index 
        @landlords = Landlord.all 
    end 

    def show 
        @landlord = Landlord.find(params[:id])
    end 

    def new 
        @landlord = Landlord.new 
    end 

    def create
        landlord = Landlord.create(landlord_params)

        redirect_to landlord_path(landlord)
    end 

    def edit 
        @landlord = Landlord.find(params[:id])
    end 

    def update 
        @landlord = Landlord.find(params[:id])
        @landlord.update(landlord_params)

        redirect_to landlord_path(@landlord)
    end 

    def destroy 
        @landlord = Landlord.find(params[:id])
        @landlord.destroy 
        # byebug
        redirect_to landlords_path
    end 

    private

    def landlord_params 
        params.require(:landlord).permit(:name, :shadyness_lvl)
    end 

end
