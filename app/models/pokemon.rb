# == Schema Information
#
# Table name: pokemon
#
#  id         :bigint           not null, primary key
#  species    :string
#  vanilla    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_pokemon_on_species  (species) UNIQUE
#

class Pokemon < ApplicationRecord
  has_creator optional: true
  has_many :forms, class_name: 'Pokemon::Form', dependent: :destroy
  
  validates :species, presence: true
  validates :creator, presence: true, if: :custom?
  validates :creator, absence: true, if: :vanilla?

  def custom?
    not vanilla?
  end
end
