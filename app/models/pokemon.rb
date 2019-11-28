class Pokemon
  include Helpers

  LIST = JSON.parse(File.read(Rails.root.join('config/pokemon.json')))
  IDS = JSON.parse(File.read(Rails.root.join('config/pokemon_ids.json')))
  
  class << self
    def find(id)
      new(LIST.fetch(IDS.fetch(id)))
    end
  end

  def initialize(data)
    @data = data
  end

  def to_h
    @data
  end

  def id
    @data['id']
  end

  def name
    @data['displayName']
  end

  def dex_entry
    @data['dexEntry']
  end

  def type1
    @data['types'].first
  end

  def type2
    @data['types'].second
  end

  def image
    @data['image']
  end

  def inspect
    name
  end

  def pokedex_id
    id
  end
end