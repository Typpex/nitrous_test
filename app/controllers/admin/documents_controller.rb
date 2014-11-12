class Admin::DocumentsController < Admin::AdminController
  expose :scammer
  def index
    @documents = scammer.documents
  end

  def upload
    doc = Document.new
    doc.file = params[:files]
    if doc.save
      scammer.documents << doc
      respond_to do |format|
        format.js do 
          render js: "document_uploaded"
        end
      end
    else
      byebug
      respond_to do |format|
        render js: "document_uploaded"
      end
    end

  end

  def destroy
  end
end
