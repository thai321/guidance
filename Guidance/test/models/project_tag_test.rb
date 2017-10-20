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

require 'test_helper'

class ProjectTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
