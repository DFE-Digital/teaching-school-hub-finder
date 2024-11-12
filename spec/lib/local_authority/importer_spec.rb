describe LocalAuthority::Importer do
  subject(:importer) { described_class.new(paths) }

  # File below contains 8 local authorities
  let(:paths) { [File.expand_path(File.join(__FILE__, '..', 'fake_authorities.json'))] }

  describe "#load!" do
    it "loads local authorities from given file into the database" do
      expect { importer.load! }.to change(LocalAuthority, :count).from(0).to 8
    end
  end

  describe '#clear!' do
    before do
      LocalAuthority.create!(name: 'Some name')
    end

    it "deletes all local authorities from the database" do
      expect { importer.clear! }.to change(LocalAuthority, :count).from(1).to 0
    end
  end

  describe '#reload!' do
    before do
      LocalAuthority.create!(name: 'Some name')
    end

    it "clears and loads local authorities" do
      expect { importer.reload! }.to change(LocalAuthority, :count).from(1).to 8
    end
  end
end
