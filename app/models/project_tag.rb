# == Schema Information
#
# Table name: project_tags
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  tag_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectTag < ApplicationRecord
  belongs_to :project, inverse_of: :project_tags
  belongs_to :tag, inverse_of: :project_tags
end
