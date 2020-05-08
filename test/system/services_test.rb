require "application_system_test_case"

class ServicesTest < ApplicationSystemTestCase
  setup do
    @service = services(:one)
  end

  test "visiting the index" do
    visit services_url
    assert_selector "h1", text: "Services"
  end

  test "creating a Service" do
    visit services_url
    click_on "New Service"

    fill_in "Section1", with: @service.section1
    fill_in "Section1image", with: @service.section1Image
    fill_in "Section2", with: @service.section2
    fill_in "Section2image", with: @service.section2Image
    fill_in "Section3", with: @service.section3
    fill_in "Section3image", with: @service.section3Image
    fill_in "Subtitle", with: @service.subtitle
    fill_in "Tags", with: @service.tags
    fill_in "Title", with: @service.title
    click_on "Create Service"

    assert_text "Service was successfully created"
    click_on "Back"
  end

  test "updating a Service" do
    visit services_url
    click_on "Edit", match: :first

    fill_in "Section1", with: @service.section1
    fill_in "Section1image", with: @service.section1Image
    fill_in "Section2", with: @service.section2
    fill_in "Section2image", with: @service.section2Image
    fill_in "Section3", with: @service.section3
    fill_in "Section3image", with: @service.section3Image
    fill_in "Subtitle", with: @service.subtitle
    fill_in "Tags", with: @service.tags
    fill_in "Title", with: @service.title
    click_on "Update Service"

    assert_text "Service was successfully updated"
    click_on "Back"
  end

  test "destroying a Service" do
    visit services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Service was successfully destroyed"
  end
end
