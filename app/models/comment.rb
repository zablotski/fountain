class Comment < ActiveRecord::Base
  belongs_to :photo
  attr_accessible :body, :photo_id, :user_name
end
