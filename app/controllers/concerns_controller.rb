class ConcernsController < ApplicationController

before_action :authenticate_user! 

	def index
		@concerns = Concern.where(user_id: current_user.id)
	end

	def new
		@user = current_user
		@concern = Concern.new
	end

	def edit
		populate_concern
	end

	def update
		populate_concern
		@concern.update(concern_params)
		redirect_to root_path
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
		populate_concern
	end

	def destroy
		populate_concern
		@concern.destroy
		redirect_to root_path
	end

private

	def populate_concern
		@concern = Concern.find( params[:id] )
	end

  def concern_params
    params.require(:concern).permit(:text)
  end

end