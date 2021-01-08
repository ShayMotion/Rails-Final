class User < ApplicationRecord
    has_secure_password
    has_many :guitars 
    has_many :auctions

    has_many :guitars_through_auctions, through: :auctions, source: :guitars
    has_many :auctions_through_guitars, through: :guitars, source: :auction
    has_many :locations_through_auctions, through: :auctions, source: :location

    validates :username, uniqueness: true, presence: true
    validates :email, presence: true

    def self.find_or_create_from_auth_hash(auth)
      where(email: auth.info.email).first_or_initialize.tap do |user|
        user.name = auth.info.name
        user.username = auth.info.email
        user.email = auth.info.email
        user.save(validate: false)
      end
	  end
end