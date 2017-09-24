# == Schema Information
#
# Table name: steps
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :text             not null
#  project_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Step < ApplicationRecord
  validates :title, presence: true

  belongs_to :project,
    primary_key: :id,
    foreign_key: :project_id,
    class_name: :Project,
    inverse_of: :steps
end
