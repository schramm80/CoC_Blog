class Article < ActiveRecord::Base

  validates_presence_of :titel, :body
  validates_uniqueness_of :title

end
