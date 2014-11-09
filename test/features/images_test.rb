require "test_helper"

feature "Images" do
  scenario "Upload a photo of the scammer" do
    scammer = Scammer.first
    visit admin_scammer_images_path(scammer)
    attach_file("#photo", "test/files/luffy.jpg")
  end

end
