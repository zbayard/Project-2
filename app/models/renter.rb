class Renter < ApplicationRecord
    has_many :leases
    has_many :reviews
    has_many :landlords, through: :leases

    has_secure_password
end
