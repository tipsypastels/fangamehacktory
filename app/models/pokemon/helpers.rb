module Pokemon::Helpers
  def type
    [type1, type2].compact.join(' / ')
  end
end