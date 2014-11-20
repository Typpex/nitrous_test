require "test_helper"

feature "Employees" do
  scenario "Display index page with one employee" do
    visit admin_employees_path
    page.must_have_content "Listing employees (1)"
  end

end
