class Admin::AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout "admin/application"

  before_action :authenticate_user!

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    if params.has_key? :employee_id
      @employee = Employee.find(params[:employee_id])
    else
      @employee = Employee.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    params.require(:employee).permit(:name, :licence, :sexual_orientation, :birthday, :address)
    # params[:employee]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    
  end
end