class User < ActiveRecord::Base
	has_many :reviews
	has_many :posts
	has_one :profile
	
end

class Reviews < ActiveRecord::Base
	has_many :users
	has_many :posts
end

class Profile < ActiveRecord::Base
 has_one :user

end

class Post < ActiveRecord::Base
belongs_to :user
belongs_to :profile
belongs_to :reviews

end