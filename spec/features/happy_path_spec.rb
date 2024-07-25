require "rails_helper"

RSpec.feature "Happy path", type: :feature do
  before do
    LocalAuthority::Importer.new.reload!
    Hub::Importer.new.reload!
  end

  let(:expected_hubs_names) do
    ["Chiltern Teaching School Hub", "Chiltern Teaching School Hub", "Alban Teaching School Hub"]
  end

  scenario "Performs search" do
    VCR.use_cassette("geocoder") do
      visit root_path
      expect(page).to have_text("Where do you want to find teaching school hubs?")
      fill_in "Where do you want to find teaching school hubs?", with: "Luton"
      click_button('Continue')
      hubs = all('h2 a').map(&:text)
      expect(hubs).to eq(expected_hubs_names)
    end
  end
end
