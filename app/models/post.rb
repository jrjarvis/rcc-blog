class Post < ActiveRecord::Base
	validates :title, :presence => true
	validates :title, :length => { :minimum => 5 }
	validates :title, :exclusion => { :in => ["Title"] }
	has_many :comments
end
