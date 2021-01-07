class HomepagesController < ApplicationController
    skip_before_action :renter_authorized, only: [:home]
    def home

    end 

end
