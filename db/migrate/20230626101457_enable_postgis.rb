class EnablePostgis < ActiveRecord::Migration[7.0]
  def change
    # rubocop:disable Rails/ReversibleMigration
    # enable_extension 'postgis'
    execute "CREATE EXTENSION IF NOT EXISTS postgis"
    # rubocop:enable Rails/ReversibleMigration
  end
end
