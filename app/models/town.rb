class Town < ActiveRecord::Base
    validates :name, :postal_code, presence: true
    before_validation :getLocation

  public
  def get_weather
    if self.lat && self.long
      forecast = ForecastIO.forecast(self.lat,self.long, params: { units:'si', lang: 'fr' })
      if forecast
        return forecast.currently
      end
    end
    return nil
  end

  private
  def getLocation
    city = Nominatim.search(self.name).limit(1).first
    if city
      self.lat = city.lat
      self.long = city.lon
    end
  end

end
