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

require 'test_helper'

class FieldTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
