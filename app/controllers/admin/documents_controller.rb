class Admin::DocumentsController < Admin::AdminController
  expose :employee
  respond_to(:html, :js)
  def index
    @documents = employee.documents
    respond_with(@documents)
  end

  def upload
    @doc = Document.new
    @doc.file = params[:files]
    if @doc.save
      employee.documents << @doc
      respond_with(@doc)
    else
      respond_with(employee)
    end

  end

  def destroy
  end
end
