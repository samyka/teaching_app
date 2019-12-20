class AddSkypeToInstructors < ActiveRecord::Migration
  def change
  	add_column :instructors, :skype, :string
  end
end
