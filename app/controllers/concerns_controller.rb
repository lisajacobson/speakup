class ConcernsController < ApplicationController

before_action :authenticate_user! 

	def index
		@concerns = Concern.where(user_id: current_user.id)
	end

	def new
		@user = current_user
		@concern = Concern.new
	end

	def create
		@concern = Concern.new(concern_params.merge(user_id: current_user.id))
		if @concern.save
			redirect_to user_concern_path(current_user, @concern)
		else
			render 'new'
		end
	end

	def show
		@concern = Concern.find( params[:id] )
	end

	def destroy
		@concern = Concern.find( params[:id] )
		@concern.destroy
		redirect_to root_path
	end

private
  def concern_params
    params.require(:concern).permit(:text)
  end

end