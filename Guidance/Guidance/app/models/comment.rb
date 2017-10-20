# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  description :text             not null
#  project_id  :integer          not null
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Comment < ApplicationRecord
  validates :description, presence: true, length: { minimum: 6 }
  after_initialize :ensure_description

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User,
    inverse_of: :comments

  belongs_to :project,
    primary_key: :id,
    foreign_key: :project_id,
    class_name: :Project,
    inverse_of: :comments


  private

  def ensure_description
    dumbmyText = "<p><br></p>"
    if self.description == dumbmyText
      self.description = ''
    else
      self.description = (self.description.length - '<p></p>'.length < 6 ) ? '12345' : self.description
    end
  end
end
