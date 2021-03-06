# encoding: UTF-8
require "world_airports/version"
require "world_airports/scrapper/scrapped"

module WorldAirports
  class WorldAirports::Airport
    attr_accessor :name
    attr_accessor :location
    attr_accessor :iata
    attr_accessor :icao
    attr_accessor :city
    attr_accessor :country
    attr_accessor :country_code
  end

  def self.iata(iata_code)
    airport_dt = WorldAirports::Scrapped.instance.airport_of iata_code
    airport = WorldAirports::Airport.new

    if airport_dt
      airport.name = airport_dt[:name]
      airport.location = airport_dt[:location]
      airport.icao = airport_dt[:icao]
      airport.iata = airport_dt[:iata].upcase
      airport.country = airport_dt[:country]
      airport.country_code = airport_dt[:country_code]
      airport.city = airport.location.split(",")[0]

      return airport
    end

    nil
  end
end
