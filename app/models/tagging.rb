# == Schema Information
#
# Table name: taggings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#  tag_id     :integer
#

class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :subject
end
