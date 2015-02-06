class Comment < ActiveRecord::Base
  belongs_to :event
  attr_accessible :body, :commenter
end
