class Admin::AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  layout "admin/application"

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_scammer
    if params.has_key? :scammer_id
      @scammer = Scammer.find(params[:scammer_id])
    else
      @scammer = Scammer.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def scammer_params
    params.require(:scammer).permit(:name, :licence, :sexual_orientation, :birthday, :address)
    # params[:scammer]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    
  end
end