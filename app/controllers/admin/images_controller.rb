class Admin::ImagesController < Admin::AdminController
  def new
  end

  def index
    @employee = set_employee
  end

  def create 
  end

  def update
    @employee = set_employee
    @photo = Image.new
  end

  def upload
    img = Image.new
    employee = Employee.find(params[:employee_id])
    img.employee = employee
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
    employee = Employee.find(params[:employee_id])
    if employee.photo
      employee.photo.destroy
    end
    redirect_to admin_employee_images_path(employee)
  end

end
