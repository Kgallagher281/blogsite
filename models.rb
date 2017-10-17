class User < ActiveRecord::Base
	has_many :Reviews
	
end

class Reviews < ActiveRecord::Base

end

class Profile < ActiveRecord::Base
 has_one :User
end

class Ratings < ActiveRecord::Base
belongs_to :User
belongs_to :Profile

end