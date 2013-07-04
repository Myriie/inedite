class Clothe < ActiveRecord::Base
  attr_accessible :article_id, :color, :size

  belongs_to :article

  validates :article_id, :presence => true
  validates :color, :presence => true
  validates :size, :presence => true

  default_scope order: 'clothes.created_at DESC'
end
