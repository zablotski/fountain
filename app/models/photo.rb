class Photo < ActiveRecord::Base
	has_many :comments
  belongs_to :user
  attr_accessible :description, :filter, :name, :url
end
