class UsersFake < ActiveRecord::Base
  has_one :users, :foreign_key => :id
end

