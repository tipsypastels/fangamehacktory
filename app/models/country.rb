class Country
  DATABASE = MaxMindDB.new(Rails.root.join('db/countries.mmdb'))
    .tap do |db| 
      if Rails.env.development? && ENV['DEVELOPMENT_PUBLIC_IP']
        db.local_ip_alias = ENV['DEVELOPMENT_PUBLIC_IP']
      end
    end

  def self.find(ip)
    DATABASE.lookup(ip).country
  end
end