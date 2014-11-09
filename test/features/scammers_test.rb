require "test_helper"

feature "Scammers" do
  scenario "Display index page with one scammer" do
    visit admin_scammers_path
    page.must_have_content "Listing scammers (1)"
  end

end
