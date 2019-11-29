# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  species    :string
#  vanilla    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pokemon < ApplicationRecord
  has_many :forms, class_name: 'Pokemon::Form', dependent: :destroy
  validates :species, presence: true

  def custom?
    not vanilla?
  end
end
