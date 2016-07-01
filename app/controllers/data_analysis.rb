class DataAnalysis
  def initialize(coordinate)
    @coordinate = coordinate
    @users = Array.new
  end

  def add_users(user)
    @users.push(user)
  end

  def get_users()
    return (@users)
  end

end

class UserGeodata
  def initialize(user)
    @user = user
    @coordinates = Array.new
  end

  def add_coordinates(lat, lon)
    @coordinates.push([lat, lon])
  end

  def get_coordinates()
    return (@coordinates)
  end
end


#this is out of class
def grid_coords(lat, lon, dist) # dist in meter
  dist_POLE_RADIUS = 6356752.314 # North to South 6356km
  dist_EQUATOR_RADIUS = 6378137  # East to West 6378km
  lat_degree = ( 360 * 1000 ) / ( 2 * Math::PI * dist_POLE_RADIUS )
  lng_degree = ( 360 * 1000 ) / ( 2 * Math::PI * ( dist_EQUATOR_RADIUS * Math.cos(lat.to_f * Math::PI / 180.0) ) )
  
  dist_lat = lat_degree * dist.to_f/1000
  dist_lon = lng_degree* dist.to_f/1000
  
  grid_lat = (lat.to_f/dist_lat).to_i
  grid_lon = (lon.to_f/dist_lat).to_i
  
  return ([grid_lat, grid_lon])
end