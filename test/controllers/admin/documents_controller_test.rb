require "test_helper"

describe Admin::DocumentsController do

  before do
    @employee = employees(:one)
  end

  it "must show documents related to employee" do
    get :index, employee_id: @employee
    assert_equal 1, @controller.employee.documents.size
  end

  it "must destroy document belonging to emloyee" do
    assert_difference "Document.count" do 
      delete :destroy, employee_id: @employee, id: @employee.documents.first
    end
  end

  # it "add the uploaded document to a given employee" do
  #   orphan_document = documents(:orphan_document)
  #   get :upload, employee_id: @employee, files: [orphan_document]
  # end
end
