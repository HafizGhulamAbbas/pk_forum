require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "creating a Job" do
    visit jobs_url
    click_on "New Job"

    fill_in "Closedate", with: @job.closedate
    fill_in "Department", with: @job.department
    fill_in "Description", with: @job.description
    fill_in "District", with: @job.district
    fill_in "Eligibility", with: @job.eligibility
    fill_in "Opendate", with: @job.opendate
    fill_in "Province", with: @job.province
    fill_in "Qualification", with: @job.qualification
    fill_in "Salary", with: @job.salary
    fill_in "Url", with: @job.url
    fill_in "User", with: @job.user_id
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    visit jobs_url
    click_on "Edit", match: :first

    fill_in "Closedate", with: @job.closedate
    fill_in "Department", with: @job.department
    fill_in "Description", with: @job.description
    fill_in "District", with: @job.district
    fill_in "Eligibility", with: @job.eligibility
    fill_in "Opendate", with: @job.opendate
    fill_in "Province", with: @job.province
    fill_in "Qualification", with: @job.qualification
    fill_in "Salary", with: @job.salary
    fill_in "Url", with: @job.url
    fill_in "User", with: @job.user_id
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "destroying a Job" do
    visit jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
