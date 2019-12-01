# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  action     :string
#  timelined  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  actor_id   :integer
#  post_id    :integer
#  subject_id :integer
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
