class Review < ApplicationRecord
    belongs_to :renter
    belongs_to :landlord

    validates :rating, numericality: [greater_than: 0, less_than: 11]
    
end
