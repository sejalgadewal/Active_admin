require "application_system_test_case"

class PersonalDetailsTest < ApplicationSystemTestCase
  setup do
    @personal_detail = personal_details(:one)
  end

  test "visiting the index" do
    visit personal_details_url
    assert_selector "h1", text: "Personal details"
  end

  test "should create personal detail" do
    visit personal_details_url
    click_on "New personal detail"

    fill_in "Blood group", with: @personal_detail.blood_group
    fill_in "Dob", with: @personal_detail.dob
    fill_in "Email", with: @personal_detail.email
    fill_in "Gender", with: @personal_detail.gender
    fill_in "Marital status", with: @personal_detail.marital_status
    fill_in "Mobile", with: @personal_detail.mobile
    click_on "Create Personal detail"

    assert_text "Personal detail was successfully created"
    click_on "Back"
  end

  test "should update Personal detail" do
    visit personal_detail_url(@personal_detail)
    click_on "Edit this personal detail", match: :first

    fill_in "Blood group", with: @personal_detail.blood_group
    fill_in "Dob", with: @personal_detail.dob
    fill_in "Email", with: @personal_detail.email
    fill_in "Gender", with: @personal_detail.gender
    fill_in "Marital status", with: @personal_detail.marital_status
    fill_in "Mobile", with: @personal_detail.mobile
    click_on "Update Personal detail"

    assert_text "Personal detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Personal detail" do
    visit personal_detail_url(@personal_detail)
    click_on "Destroy this personal detail", match: :first

    assert_text "Personal detail was successfully destroyed"
  end
end
