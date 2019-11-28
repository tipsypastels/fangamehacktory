# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  ancestry   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_posts_on_ancestry  (ancestry)
#

class Post < ApplicationRecord
  has_ancestry
  has_creator
end
