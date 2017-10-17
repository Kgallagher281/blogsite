class User < ActiveRecord::Base
	has_many :Reviews
	has_many :posts
	has_one :Profile
	
end

class Reviews < ActiveRecord::Base
	has_many :users
	has_many :posts
end

class Profile < ActiveRecord::Base
 has_one :User

end

class Post < ActiveRecord::Base
belongs_to :User
belongs_to :Profile
belongs_to :Reviews

end