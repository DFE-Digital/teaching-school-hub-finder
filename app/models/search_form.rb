class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::AttributeAssignment

  attribute :location

  validates :location, presence: true

  def hubs
    @hubs ||= begin
      authorities = LocalAuthority.search(location)
      Hub.by_local_authority(*authorities.pluck(:name))
    end
  end
end
