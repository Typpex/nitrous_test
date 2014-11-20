require "test_helper"

describe Admin::EmployeesController do
  describe "GET index" do 
    before do 
      get :index
    end

    it "renders admin/employees/index" do 
      must_render_template "admin/employees/index"
    end

    it "responds with success" do 
      must_respond_with :success
    end

    it "must contains at least one employee" do 
      assert_equal 1, assigns(:employees).size
    end
 
    it "must destroy the given employee" do 
      assert_routing({method: "delete", path: "admin/employees/1"}, {controller: "admin/employees", action: "destroy", id: "1"})
      assert_difference "Employee.count", -1 do 
        delete :destroy, id: employees(:one)
      end
    end

    it "create a employee" do 
      assert_difference "Employee.count", 1 do
        post :create, {employee: {name: Faker::Name.name }}
      end
    end

    it "edit a employee" do 
      employee = Employee.first
      patch :update, {id: employee.id, employee: {name: Faker::Name.name, licence: "test"}}
    end
  end
end
