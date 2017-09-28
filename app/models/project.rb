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

class Project < ApplicationRecord
  validates :title, presence: true
  validates :published, inclusion: [true, false]

  default_scope -> { order(created_at: :desc) }

  has_attached_file :image, default_url: "default_project.png",styles: {
   medium: '300x300>'
 }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  after_initialize :ensure_video_url, :ensure_image_url


  # Associations

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User,
    inverse_of: :projects

  has_many :steps,
    primary_key: :id,
    foreign_key: :project_id,
    class_name: :Step,
    inverse_of: :project

  has_many :comments,
    primary_key: :id,
    foreign_key: :project_id,
    class_name: :Comment,
    inverse_of: :project,
    dependent: :destroy

  has_many :favorites
  has_many :favorite_users,
    through: :favorites,
    source: :user

  has_many :project_tags
  has_many :tags, through: :project_tags, inverse_of: :projects



  private

  def ensure_video_url
    regex = /^.*(youtu.be\/|v\/|e\/|u\/\w+\/|embed\/|v=)([^#\&\?]*).*/
    if (self.video_url && self.video_url.match(regex))
      self.video_url = 'https://www.youtube.com/embed/' + self.video_url.match(regex)[2]
    # else
    #   self.video_url = 'https://youtu.be/8aGhZQkoFbQ'
    end
  end

  def ensure_image_url
    self.image.url.downcase!
  end

end
