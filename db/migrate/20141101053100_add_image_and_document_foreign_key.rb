class AddImageAndDocumentForeignKey < ActiveRecord::Migration
  def change
    add_column :documents, :employee_id, :integer
    add_column :images, :employee_id, :integer
  end
end
