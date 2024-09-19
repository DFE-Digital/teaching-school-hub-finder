RSpec.describe Hub, type: :model do
  before do
    LocalAuthority::Importer.new.reload!
    Hub::Importer.new.reload!
  end

  let(:authorities) { ["Birmingham South", "Birmingham North", "Sandwell", "Dudley", "Bromsgrove", "Wyre Forest"] }
  let(:hub_names) do
    ["Star Teaching School Hub Birmingham South", "Arthur Terry Teaching School Hub - North Birmingham",
     "Haybridge Teaching School Hub", "Tudor Grange Teaching School Hub", "Prince Henry's Teaching School Hub"]
  end

  it "sorts results by distance" do
    expect(described_class.by_local_authority(*authorities).map(&:name)).to eq(hub_names)
  end
end
