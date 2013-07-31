class Clothe < ActiveRecord::Base
  attr_accessible :size, :color, :article_id, :stock, :reserve

  belongs_to :article

  validates :article_id, :presence => true
  validates :color, :presence => true
  validates :size, :presence => true

  default_scope order: 'clothes.created_at DESC'
end
