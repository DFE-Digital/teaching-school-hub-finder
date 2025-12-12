require "rails_helper"

RSpec.describe LocalAuthority::Search do
  subject(:search) { described_class.new(LocalAuthority, "London") }

  describe "#geo_result" do
    context "when the geocoding service is unavailable" do
      before do
        allow(Geocoder).to receive(:search).and_raise(Geocoder::ServiceUnavailable)
      end

      it "raises LocalAuthority::ServiceUnavailable" do
        expect { search.call }.to raise_error(LocalAuthority::ServiceUnavailable)
      end
    end

    context "when a network error occurs" do
      before do
        allow(Geocoder).to receive(:search).and_raise(Geocoder::NetworkError)
      end

      it "raises LocalAuthority::ServiceUnavailable" do
        expect { search.call }.to raise_error(LocalAuthority::ServiceUnavailable)
      end
    end

    context "when a timeout occurs" do
      before do
        allow(Geocoder).to receive(:search).and_raise(Geocoder::LookupTimeout)
      end

      it "raises LocalAuthority::ServiceUnavailable" do
        expect { search.call }.to raise_error(LocalAuthority::ServiceUnavailable)
      end
    end

    context "when the API returns no results" do
      before do
        allow(Geocoder).to receive(:search).and_return([])
      end

      it "returns an empty array" do
        expect(search.call).to eq([])
      end
    end
  end
end
