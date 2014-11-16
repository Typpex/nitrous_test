class Admin::ImagesController < Admin::AdminController
  def new
  end

  def index
    @scammer = set_scammer
  end

  def create 
  end

  def update
    @scammer = set_scammer
    @photo = Image.new
  end

  def upload
    img = Image.new
    scammer = Scammer.find(params[:scammer_id])
    img.scammer = scammer
    img.file = params[:files]
    img.save
    response = {"files" => []}
    response["files"][0] = img.to_json()
    respond_to do |format|
      format.json do
        render json: response
      end
    end
  end

  def destroy
    scammer = Scammer.find(params[:scammer_id])
    if scammer.photo
      scammer.photo.destroy
    end
    redirect_to admin_scammer_images_path(scammer)
  end

end
