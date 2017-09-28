# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
  has_many :project_tags
  has_many :projects, through: :project_tags, inverse_of: :tags
end
