class Reservation < ActiveRecord::Base
  attr_accessible :article_id, :panier_id, :quantity
  belongs_to :panier
  has_one :article
end

