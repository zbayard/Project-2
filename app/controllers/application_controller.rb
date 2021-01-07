class ApplicationController < ActionController::Base
    helper_method :renter_logged_in?
    # helper_method :renter_authorized
    
    before_action :renter_authorized

    def set_current_renter
        
        @current_renter = Renter.find_by(id: session[:renter_id])
    end

    def renter_logged_in?
        !set_current_renter.nil?
    end


    def renter_authorized
        redirect_to renter_login_path unless renter_logged_in?
    end

    

end
