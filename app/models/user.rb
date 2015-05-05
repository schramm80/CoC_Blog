class User < ActiveRecord::Base

  has_many :articles
  belongs_to :role


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
