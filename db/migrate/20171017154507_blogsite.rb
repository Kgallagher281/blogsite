class Blogsite < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |t|
		t.string  :first
		t.string  :last
		t.string  :email
		t.string  :password
end

  	create_table :reviews do |t|
  		t.string :body
  		t.integer :rating
  		t.references :user, foreign_key: {to_table: :users}, index: true
  		t.datetime :created_at
end


	create_table :posts do |t|
		t.string :genre
		t.integer :created_at
		t.string  :user_id
		t.string :url

	end
	create_table :profiles do |t|
		t.string :group
		t.string :position
		t.string :user_id
		t.string :about_me
		t.string :birth
		end
	end
end  
