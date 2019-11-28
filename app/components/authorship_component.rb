class AuthorshipComponent < Components::Component
  attribute :avatar
  attribute :title
  attribute :subtitle

  validates :avatar, :title, presence: true
end
