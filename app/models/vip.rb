class Vip < Member
  role_display '#06c1b5', 'VIP', italics: true

  def vip?
    true
  end
end
