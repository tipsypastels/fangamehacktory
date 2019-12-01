# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  action          :string           not null
#  notifiable_type :string
#  read            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  actor_id        :integer
#  notifiable_id   :integer
#  user_id         :integer
#

require 'rails_helper'

RSpec.describe Notification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
