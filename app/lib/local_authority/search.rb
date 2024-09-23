class LocalAuthority::Search
  RESULT_LIMIT = 15

  def initialize(scope, query)
    @scope = scope
    @query = query
  end

  def call
    return [] if geo_result.nil?

    result = @scope.order_by_distance_from(search_centre)

    if search_polygon
      result.where("ST_Intersects(geometry, ?)", search_polygon)
    else
      result.limit(RESULT_LIMIT)
    end
  end

  def search_centre
    transform RGeo::Geographic.spherical_factory.point(geo_result.longitude, geo_result.latitude)
  end

  def geo_result
    @geo_result ||= Geocoder.search("#{@query}, UK").first
  end

  def search_polygon
    return @search_polygon if defined? @search_polygon

    json = geo_result && geo_result.data['geojson']
    return @search_polygon = nil unless json

    transform RGeo::GeoJSON.decode(json.to_json)
  end

  def transform(geo)
    RGeo::CoordSys::Proj4.transform(
      RGeo::CoordSys::Proj4.new("EPSG:4326"),
      geo,
      RGeo::CoordSys::Proj4.new("EPSG:27700"),
      RGeo::Cartesian.preferred_factory
    )
  end
end
