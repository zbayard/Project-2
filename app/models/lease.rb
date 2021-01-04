class Lease < ApplicationRecord
    belongs_to :renter
    belongs_to :landlord
end
