class User < ActiveRecord::Base

  belongs_to :role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
