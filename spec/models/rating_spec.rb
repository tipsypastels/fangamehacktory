# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :string
#  user_id    :integer
#
# Indexes
#
#  index_ratings_on_user_id_and_subject_id  (user_id,subject_id)
#

require 'rails_helper'

RSpec.describe Rating, type: :model do
  before :each do
    Current.user = create(:user)
    @subject = create(:subject)
  end

  it 'counts the overall and number of ratings' do
    @subject.ratings.create! type: 'Rating::Like'

    expect(@subject.ratings_count).to eq 1
    expect(@subject.overall_rating).to eq 1
  end

  xit 'includes different magnitudes of rating' do
    @subject.ratings.create! type: 'Rating::Like'
    @subject.ratings.create! type: 'Rating::Dislike'

    expect(@subject.ratings_count).to eq 2
    expect(@subject.overall_rating).to eq 0
  end
end
