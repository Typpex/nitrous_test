class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|

      t.timestamps
    end

    add_attachment :documents, :file
  end
end
