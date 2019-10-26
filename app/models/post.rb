# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  topic_id   :integer
#  ancestry   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_ancestry  (ancestry)
#

class Post < ApplicationRecord
  has_ancestry
end
