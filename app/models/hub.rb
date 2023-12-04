class Hub < ApplicationRecord
  def self.by_local_authority(*authorities)
    result = []
    authorities.each do |authority|
      result << where("areas && ARRAY[?]::varchar[]", [authority]).to_a
    end
    result.flatten.uniq
  end
end
