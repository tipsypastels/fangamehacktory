module Topic::TeamScoped
  extend ActiveSupport::Concern

  included do
    belongs_to :team,
      optional: true,
      foreign_key: 'team_id',
      class_name: 'Team'
  end
end