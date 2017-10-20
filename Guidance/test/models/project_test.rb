# == Schema Information
#
# Table name: projects
#
#  id                 :integer          not null, primary key
#  title              :string           not null
#  description        :text             not null
#  video_url          :string
#  published          :boolean          default(FALSE), not null
#  author_id          :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
