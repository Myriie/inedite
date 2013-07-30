class Other < ActiveRecord::Base
  attr_accessible :reserve, :stock
  belongs_to :article
end
