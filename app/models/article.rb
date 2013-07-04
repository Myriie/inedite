# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  price       :float
#  type        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :description, :id, :price, :title, :type_art

  has_many :clothes, dependent: :destroy
end
