class UserController < ActionController::Base
	has_many :responses, :concerns
end