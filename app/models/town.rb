class Town < ActiveRecord::Base
    validates :name, :postal_code, presence: true
    before_validation :getLocation

  private
  def getLocation
    city = Nominatim.search(self.name).limit(1).first
    if city
      self.lat = city.lat
      self.long = city.lon
    end
  end

end
