class RentersController < ApplicationController
    before_action :get_renter, only: [:show, :edit, :update, :destroy]
    skip_before_action :renter_authorized, only: [:login, :handle_login, :new, :create]

    def login
        @error = flash[:error]
    end

    def handle_login
        @renter = Renter.find_by(username: params[:username])

        if @renter && @renter.authenticate(params[:password])
            session[:renter_id] = @renter.id
            redirect_to renter_path(@renter)
        else
            flash[:error] = "Incorrect username or password"
            redirect_to renter_login_path
            # ? Are we going to need separate login paths for renter/landlord??
        end
    end

    def logout
        session[:renter_id] = nil
        
        redirect_to homepages_path
    end


    def index 
        @renters = Renter.all 
    end 

    
    # def show 
    #     @current_renter = Renter.find_by(id: session[:student_id])
       
    #     # @landlord = Landlord.find(params[:id])
    # end 

    def new 
        @renter = Renter.new 
    end 

    def create
        @renter = Renter.create(renter_params)

        if @renter.valid?
            session[:renter_id] = @renter.id
            redirect_to renter_path(@renter)
          
        else 
            flash[:errors] = @renter.errors.full_messages
            redirect_to new_renter_path
        end
    end 

     # we might not need this action thanks to before_action 
    def edit 
        # @renter = Renter.find(params[:id])
        @renter = @current_renter
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
        params.require(:renter).permit(:name, :age, :username, :password)
    end 

    def get_renter
        @renter = Renter.find(params[:id])
    end 
end
