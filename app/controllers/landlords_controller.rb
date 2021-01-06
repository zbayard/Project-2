class LandlordsController < ApplicationController
    
   
    
    

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
            session[:landlord_id] = @landlord.id
            redirect_to landlord_path(@landlord)
          
        else 
            flash[:errors] = @landlord.errors.full_messages
            redirect_to new_landlord_path
        end
    end 

    # we might not need this action thanks to before_action 
    def edit 
        @landlord = @current_landlord
        # @landlord = Landlord.find(params[:id])
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
