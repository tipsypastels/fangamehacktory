class Admin < Vip
  role_display '#ed8936', bold: true

  def admin?
    true
  end

  def vip?
    true # all admins are VIPs
  end
end
