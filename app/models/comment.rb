class Comment < ActiveRecord::Base
  belongs_to :Prototype
  belongs_to :User
end
