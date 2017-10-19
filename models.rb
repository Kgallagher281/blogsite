class User < ActiveRecord::Base
	has_many :reviews
	has_many :posts
	has_one :profile
	
end

class Review < ActiveRecord::Base
	has_many :users
	belongs_to :post
end

class Profile < ActiveRecord::Base
 has_one :user

end

class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :profile
	has_many :reviews
end