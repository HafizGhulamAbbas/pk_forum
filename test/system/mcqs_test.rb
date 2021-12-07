require "application_system_test_case"

class McqsTest < ApplicationSystemTestCase
  setup do
    @mcq = mcqs(:one)
  end

  test "visiting the index" do
    visit mcqs_url
    assert_selector "h1", text: "Mcqs"
  end

  test "creating a Mcq" do
    visit mcqs_url
    click_on "New Mcq"

    fill_in "Correctoption", with: @mcq.correctOption
    fill_in "Moreinfo", with: @mcq.moreInfo
    fill_in "Optiona", with: @mcq.optionA
    fill_in "Optionb", with: @mcq.optionB
    fill_in "Optionc", with: @mcq.optionC
    fill_in "Optiond", with: @mcq.optionD
    fill_in "Optione", with: @mcq.optionE
    fill_in "Question", with: @mcq.question
    click_on "Create Mcq"

    assert_text "Mcq was successfully created"
    click_on "Back"
  end

  test "updating a Mcq" do
    visit mcqs_url
    click_on "Edit", match: :first

    fill_in "Correctoption", with: @mcq.correctOption
    fill_in "Moreinfo", with: @mcq.moreInfo
    fill_in "Optiona", with: @mcq.optionA
    fill_in "Optionb", with: @mcq.optionB
    fill_in "Optionc", with: @mcq.optionC
    fill_in "Optiond", with: @mcq.optionD
    fill_in "Optione", with: @mcq.optionE
    fill_in "Question", with: @mcq.question
    click_on "Update Mcq"

    assert_text "Mcq was successfully updated"
    click_on "Back"
  end

  test "destroying a Mcq" do
    visit mcqs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mcq was successfully destroyed"
  end
end
