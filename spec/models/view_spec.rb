# == Schema Information
#
# Table name: views
#
#  id         :bigint           not null, primary key
#  country    :string
#  ip_address :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe View, type: :model do
  before :each do
    Current.user = create(:user)
    Current.ip_address = Faker::Internet.ip_v4_address
    
    @subject = create(:subject)
  end

  context 'counting' do
    it 'counts up with a 1 minute delay' do
      @subject.views.create!
      @subject.views.create!

      expect(@subject.views_count).to eq 1
    end

    it 'adds correctly after the delay' do
      @subject.views.create!
      travel Subject::Viewable::REPEAT_VIEW_DELAY + 1
      @subject.views.create!

      expect(@subject.views_count).to eq 2
    end
  end

  context 'read and unread' do
    it 'tracks if a subject is read' do
      expect(@subject.unread?).to be_truthy
      @subject.views.create!
      expect(@subject.unread?).to be_falsey
    end

    it 'reverts to unread when an update is made' do
      @subject.views.create!
      expect(@subject.unread?).to be_falsey
      @subject.touch
      expect(@subject.unread?).to be_truthy
    end
  end
end
