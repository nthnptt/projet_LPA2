require 'test_helper'

class TownTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "town not exists" do
    VCR.use_cassette("town_not_exists") do
      unknown = Town.new
      unknown.name = 'MyString'
      assert !unknown.valid?
    end
  end

  test "town validation does geocoding"  do
    VCR.use_cassette("town_validation_geocoding") do
      belfort = Town.new
      belfort.name = 'belfort'
      belfort.postal_code = '90000'
      assert belfort.valid?
      assert_equal(47.6379599, belfort.lat)
      assert_equal(6.8628942, belfort.long)
    end
  end

  test "validation town get weather"  do
    VCR.use_cassette("town_validation_geocoding") do
      belfort = Town.new
      belfort.name = 'belfort'
      belfort.postal_code = '90000'
      belfort.valid?
      VCR.use_cassette("get_town_and_get_weather") do
        weather=belfort.get_weather()
        assert_equal(weather.summary,'Dégagé')
        assert_equal(weather.temperature,6.54)
      end
    end
  end

  test "validation get weather with bad town"  do
    VCR.use_cassette("town_not_exists") do
      bad_town = Town.new
      bad_town.name = 'MyString'
      bad_town.postal_code = '90000'
      bad_town.valid?
      VCR.use_cassette("get_town_and_get_weather_with_bad_town") do
        weather=bad_town.get_weather()
        assert_nil(weather)
      end
    end
  end
end
