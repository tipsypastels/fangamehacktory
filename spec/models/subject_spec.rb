# == Schema Information
#
# Table name: subjects
#
#  id                     :bigint           not null, primary key
#  color                  :string           default("#1c1c1e")
#  events_count           :integer          default(0)
#  overall_rating         :integer          default(0), not null
#  ratings_count          :integer          default(0), not null
#  slug                   :string
#  status                 :integer          default("draft")
#  subjected_type         :string
#  timelined_events_count :integer          default(0)
#  title                  :string
#  views_count            :integer          default(0)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  subjected_id           :integer
#  team_id                :integer
#  user_id                :integer
#
# Indexes
#
#  index_subjects_on_slug                             (slug) UNIQUE
#  index_subjects_on_subjected_id_and_subjected_type  (subjected_id,subjected_type)
#

require 'rails_helper'

RSpec.describe Subject, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
