class User < ActiveRecord::Base

  belongs_to :role
  has_many :articles
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
