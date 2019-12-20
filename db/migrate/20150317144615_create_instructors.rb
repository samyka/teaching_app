class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :country_of_origin
      t.string :first_language
      t.string :subject_to_teach
      t.string :education
      t.integer :teacher_id
  		# t.money :price
	    t.integer  "price_cents",       default: 0,     null: false
	    t.string   "price_currency",    default: "USD", null: false
      t.text :about

      t.timestamps null: false
    end
  end
end
