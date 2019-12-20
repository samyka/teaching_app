class AddDocumentToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :document, :string
  end
end
