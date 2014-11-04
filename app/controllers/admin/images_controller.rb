class Admin::ImagesController < Admin::AdminController
  def new
  end

  def create 
  end

  def update
    @scammer = set_scammer
    @photo = Image.new
  end

  def upload
  end

end
