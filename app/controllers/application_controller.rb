class ApplicationController < ActionController::Base
    helper_method :renter_logged_in?
    helper_method :landlord_logged_in?
    helper_method :renter_authorized
    helper_method :landlord_authorized
    before_action :renter_authorized, only: [:set_current_renter, :renter_logged_in?]
    before_action :landlord_authorized, only: [:set_current_landlord, :landlord_logged_in?]

    def set_current_renter
        
        @current_renter = Renter.find_by(id: session[:renter_id])
    end

    def set_current_landlord
  
        @current_landlord = Landlord.find_by(id: session[:landlord_id])
    end

    def renter_logged_in?
        
        !set_current_renter.nil?
    end

    def landlord_logged_in?
       
        !set_current_landlord.nil?
    end

    def renter_authorized
        redirect_to renter_login_path unless renter_logged_in?
    end

    def landlord_authorized
        redirect_to landlord_login_path unless landlord_logged_in?
    end

end
