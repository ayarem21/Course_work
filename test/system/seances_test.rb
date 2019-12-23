require "application_system_test_case"

class SeancesTest < ApplicationSystemTestCase
  setup do
    @seance = seances(:one)
  end

  test "visiting the index" do
    visit seances_url
    assert_selector "h1", text: "Seances"
  end

  test "creating a Seance" do
    visit seances_url
    click_on "New Seance"

    fill_in "Film", with: @seance.film_id
    fill_in "Hall", with: @seance.hall_id
    fill_in "Time", with: @seance.time
    click_on "Create Seance"

    assert_text "Seance was successfully created"
    click_on "Back"
  end

  test "updating a Seance" do
    visit seances_url
    click_on "Edit", match: :first

    fill_in "Film", with: @seance.film_id
    fill_in "Hall", with: @seance.hall_id
    fill_in "Time", with: @seance.time
    click_on "Update Seance"

    assert_text "Seance was successfully updated"
    click_on "Back"
  end

  test "destroying a Seance" do
    visit seances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Seance was successfully destroyed"
  end
end
