class Clothe < ActiveRecord::Base
  attr_accessible :article_id, :color, :size
  belongs_to :article

  validates :size, :presence => true
  validates :article_id, :presence => true
  validates :color, :presence => true

  default_scope order: 'clothe.created_at DESC'
end
