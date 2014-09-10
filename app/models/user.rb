class User < ActiveRecord::Base
  has_many :concerns

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



end