class LocalAuthority < ApplicationRecord
  def self.by_name(name)
    where("name ILIKE '%#{name}%'")
  end
end
