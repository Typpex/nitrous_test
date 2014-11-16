class Admin::DocumentsController < Admin::AdminController
  expose :scammer
  respond_to(:html, :js)
  def index
    @documents = scammer.documents
    respond_with(@documents)
  end

  def upload
    @doc = Document.new
    @doc.file = params[:files]
    if @doc.save
      scammer.documents << @doc
      respond_with(@doc)
    else
      respond_with(scammer)
    end

  end

  def destroy
  end
end
