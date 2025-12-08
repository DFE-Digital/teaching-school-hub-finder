require "rails_helper"

RSpec.feature "Geocoding service unavailable", type: :feature do
  scenario "displays error message when Ordnance Survey API is unavailable" do
    allow(Geocoder).to receive(:search).and_raise(Geocoder::ServiceUnavailable)

    visit root_path
    fill_in "Where do you want to find teaching school hubs?", with: "London"
    click_button("Continue")

    expect(page).to have_text("Sorry, there's a problem with the service")
    expect(page).to have_text("Please try again later.")
  end

  scenario "displays error message when network error occurs" do
    allow(Geocoder).to receive(:search).and_raise(Geocoder::NetworkError)

    visit root_path
    fill_in "Where do you want to find teaching school hubs?", with: "Manchester"
    click_button("Continue")

    expect(page).to have_text("Sorry, there's a problem with the service")
    expect(page).to have_text("Please try again later.")
  end

  scenario "displays error message when lookup times out" do
    allow(Geocoder).to receive(:search).and_raise(Geocoder::LookupTimeout)

    visit root_path
    fill_in "Where do you want to find teaching school hubs?", with: "Birmingham"
    click_button("Continue")

    expect(page).to have_text("Sorry, there's a problem with the service")
    expect(page).to have_text("Please try again later.")
  end
end
