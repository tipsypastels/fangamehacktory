# == Schema Information
#
# Table name: fields
#
#  id         :integer          not null, primary key
#  topic_id   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :integer
#

class Field < ApplicationRecord
  default_scope { includes :rich_text_content }

  belongs_to :topic, touch: true
  acts_as_list scope: :topic

  validates :name, presence: true
  has_rich_text :content

  def display_name
    name.titlecase
  end

  def blank?
    content.blank? || content.to_s.match?(/^<div><\/div>$/)
  end

  def widget
    content.to_s.match(/(?:<div>)?widget:(\w+)(?:<\/div>)?/)
    $1
  end
  alias widget? widget
end
