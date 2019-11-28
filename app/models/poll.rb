class Poll < ApplicationRecord
  default_scope { includes(:options) }
  scope :open, -> { where(status: :open) }

  belongs_to :subject

  has_many :options
  has_many :votes, through: :options
  
  validates :title, presence: true
  validates :options, length: { minimum: 1 }

  enum status: {
    open:     0,
    closed:   1,
    archived: 2,
  }

  accepts_nested_attributes_for :options, allow_destroy: true

  acts_as_api
  api_accessible :public do |api|
    api.add :title
    api.add :options
  end
end
