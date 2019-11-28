class Pokedex < Array
  attr_reader :game

  def initialize(raw, game)
    @raw = raw
    @game = game
    super(raw.split(',').map { |e| pokemon_from_id(e.to_i) })
  end

  def push(pokemon)
    game.update! pokedex: @raw + ",#{pokemon.pokedex_id}"
    super
  end
  alias << push

  private

  def pokemon_from_id(id)
    if id.positive?
      Pokemon.find(id)
    else
      game.fakemon.find(id.abs)
    end
  end
end