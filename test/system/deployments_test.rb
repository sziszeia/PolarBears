require "application_system_test_case"

class DeploymentsTest < ApplicationSystemTestCase
  setup do
    @deployment = deployments(:one)
  end

  test "visiting the index" do
    visit deployments_url
    assert_selector "h1", text: "Deployments"
  end

  test "creating a Deployment" do
    visit deployments_url
    click_on "New Deployment"

    fill_in "Age class", with: @deployment.Age_class
    fill_in "Bearid", with: @deployment.BearID
    fill_in "Ear applied", with: @deployment.Ear_applied
    fill_in "Ptt id", with: @deployment.PTT_ID
    fill_in "Sex", with: @deployment.Sex
    fill_in "Capture lat", with: @deployment.capture_lat
    fill_in "Capture long", with: @deployment.capture_long
    click_on "Create Deployment"

    assert_text "Deployment was successfully created"
    click_on "Back"
  end

  test "updating a Deployment" do
    visit deployments_url
    click_on "Edit", match: :first

    fill_in "Age class", with: @deployment.Age_class
    fill_in "Bearid", with: @deployment.BearID
    fill_in "Ear applied", with: @deployment.Ear_applied
    fill_in "Ptt id", with: @deployment.PTT_ID
    fill_in "Sex", with: @deployment.Sex
    fill_in "Capture lat", with: @deployment.capture_lat
    fill_in "Capture long", with: @deployment.capture_long
    click_on "Update Deployment"

    assert_text "Deployment was successfully updated"
    click_on "Back"
  end

  test "destroying a Deployment" do
    visit deployments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Deployment was successfully destroyed"
  end
end
