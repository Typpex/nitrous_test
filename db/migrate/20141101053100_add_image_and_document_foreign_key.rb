class AddImageAndDocumentForeignKey < ActiveRecord::Migration
  def change
    add_column :documents, :scammer_id, :integer
    add_column :images, :scammer_id, :integer
  end
end
