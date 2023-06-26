class LocalAuthority::Importer
  DEFAULT_SOURCE = Rails.root.join("db/data/authorities.json").freeze
  attr_reader :path

  def initialize(path = DEFAULT_SOURCE)
    @path = path
  end

  def reload!
    clear!
    load!
  end

  def clear!
    LocalAuthority.delete_all
  end

  def load!
    Rails.logger.debug("Loading #{@path}")

    features = read_file(@path)

    features.each do |feature|
      LocalAuthority.create!(
        name: feature.properties["LAD22NM"],
        geometry: feature.geometry
      )
    end
  end

  private

  def read_file(geojson_path)
    file = File.read(geojson_path)
    RGeo::GeoJSON.decode(file, json_parser: :json)
  end
end
