class Panier < ActiveRecord::Base
  attr_accessible :user_id, :validated
	belongs_to :user
	has_many :reservations

  validates :user_id, presence: true
end
