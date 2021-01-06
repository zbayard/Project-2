class Landlord < ApplicationRecord
    has_many :leases
    has_many :reviews
    has_many :renters, through: :leases

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :location, presence: true
    validates :password, presence: true


    has_secure_password

    def average_rating
        landlord_reviews=reviews.all.select {|review| review.landlord_id == self.id}
        ratings_sum=landlord_reviews.sum {|review| review.rating}
        average=ratings_sum/landlord_reviews.count.to_f
        rounded_ave=average.round(1)
    end

end
