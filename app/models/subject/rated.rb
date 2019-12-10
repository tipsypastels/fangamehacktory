module Subject::Rated
  extend ActiveSupport::Concern

  included do
    has_many :ratings
    has_many :users_who_rated, through: :ratings,
      class_name: 'User', source: :user
  end
end