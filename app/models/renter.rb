class Renter < ApplicationRecord
    has_many :leases
    has_many :reviews
    has_many :landlords, through: :leases

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true

    has_secure_password

    def average_rating
        renter_reviews = reviews.all.select {|review| review.renter_id == self.id}
        ratings_sum = renter_reviews.sum {|review| review.rating}
        average=ratings_sum/renter_reviews.count.to_f
        rounded_ave=average.round(1)
    end
end
