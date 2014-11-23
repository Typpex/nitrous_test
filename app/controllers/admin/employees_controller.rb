class Admin::EmployeesController < Admin::AdminController
  expose :employee
  respond_to :html, :json

  def authorize
    if employee
      authorize employee
    else
      authorize
    end
  end

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    employee.save
    redirect_to admin_employees_path
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    if employee.save
      redirect_to admin_employees_path
    else
      render :edit
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    employee.destroy
    respond_to do |format|
      format.html { redirect_to admin_employees_path, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


end
