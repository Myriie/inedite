class Other < ActiveRecord::Base
  	attr_accessible :article_id, :reserve, :stock
 	belongs_to :article

  	validates :article_id, :presence => true
end
