class LocalAuthority::Importer
  DEFAULT_SOURCES = (1..LOCAL_AUTHORITIES_FILES_COUNT).map { |num|
 Rails.root.join("db/data/authorities_#{num}.json") }.freeze
  attr_reader :path

  def initialize(paths = DEFAULT_SOURCES)
    @paths= paths
  end

  def reload!
    ApplicationRecord.transaction do
      clear
      load
    end
  end

  def clear!
    ApplicationRecord.transaction { clear }
  end

  def load!
    ApplicationRecord.transaction { load }
  end

  private

  def read_file(geojson_path)
    file = File.read(geojson_path)
    RGeo::GeoJSON.decode(file, json_parser: :json)
  end

  def load
    @paths.each do |path|
      Rails.logger.debug("Loading #{path}")

      features = read_file(path)

      features.each do |feature|
        LocalAuthority.create!(
          name: feature.properties["LAD24NM"],
          geometry: feature.geometry
        )
      end
    end
  end

  def clear
    LocalAuthority.delete_all
  end
end
