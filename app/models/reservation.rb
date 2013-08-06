class Reservation < ActiveRecord::Base
  attr_accessible :article_id, :panier_id, :quantity, :product_id, :product_type
  belongs_to :panier
  has_one :article
  has_one :other
  has_one :clothe
end

