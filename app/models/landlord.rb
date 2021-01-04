class Landlord < ApplicationRecord
    has_many :leases
    has_many :reviews
    has_many :renters, through: :leases
end
