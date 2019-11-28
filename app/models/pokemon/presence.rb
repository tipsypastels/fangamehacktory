# == Schema Information
#
# Table name: pokemon_presences
#
#  id                :bigint           not null, primary key
#  customized_name   :string
#  customized_type1  :string
#  customized_type2  :string
#  national_position :integer
#  regional_position :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  form_id           :integer
#  pokedex_id        :integer
#

class Pokemon::Presence < ApplicationRecord
  default_scope {
    includes(form: :pokemon)
  }

  scope :regional, -> {
    where.not(regional_position: nil)
  }

  belongs_to :pokedex
  belongs_to :form, class_name: 'Pokemon::Form'

  has_rich_text :catching_instructions
  has_rich_text :customized_dex_entry
  has_one_attached :customized_sprite

  validates :national_position, presence: true

  def name
    customized_name.presence || form.name
  end

  def type1
    customized_type1.presence || form.type1
  end

  def type2
    customized_type2.presence || form.type2
  end
  
  def type
    [type1, type2].compact.join(' / ')
  end

  def dex_entry
    customized_dex_entry.presence || form.dex_entry
  end

  def sprite
    customized_sprite.presence || begin
      form.sprite if form.vanilla?
    end
  end
end
