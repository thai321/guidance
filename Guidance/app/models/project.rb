# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  image_url   :string           not null
#  video_url   :string           not null
#  published   :boolean          default(FALSE), not null
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ApplicationRecord
  validates :title, :description, presence: true
  validates :published, inclusion: [true, false]

  has_attached_file :image, default_url: "my_cat.jpg",styles: {
   thumb: '100x100>',
   square: '200x200#',
   medium: '300x300>'
 }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User,
    inverse_of: :projects

end
