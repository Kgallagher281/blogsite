class Blogsite < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |t|
		t.string  :first
		t.string  :last
		t.string  :email
		t.string  :group

end

  	create_table :reviews do |t|
  		t.string :ratings
  		t.string :genre
  		t.string :comments
  		t.string :user_id
  		t.references :user, foreign_key: {to_table: :users}, index: true
  		t.datetime :created_at
end

	create_table :ratingsystem do |t|
		t.integer :number
		end
	create_table :profile do |t|
		t.string :group
		t.string :bio
		t.string :position
		t.string :user_id
		t.string :about_me
		t.string :birth
		t.string :post
		t.img :profile_img
		end
	end
end  
