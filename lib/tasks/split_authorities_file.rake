require 'rake'
LOCAL_AUTHORITIES_COUNT_PER_FILE = 80
namespace :tshf do

  desc <<-DESC
Split authorities file

The rake assumes there is `db/data/authorities.json` file. Splits the file into smaller ones.
  DESC
  task split_file: :environment do
    file = Rails.root.join("db/data/authorities.json").freeze

    LOCAL_AUTHORITIES_FILES_COUNT.times do |i|
      data = JSON(File.read(file))
      data["features"] = 
data["features"][(LOCAL_AUTHORITIES_COUNT_PER_FILE*i)...(LOCAL_AUTHORITIES_COUNT_PER_FILE*(i+1))]

      filename = Rails.root.join("db/data/authorities_#{i+1}.json")
      File.open(filename, 'w') { |f| f.write(data.to_json) }
    end
  end
end