class ConcernsController < ApplicationController	
	
	def index
		@concerns = Concern.all
	end

	def new
		@user = current_user
		@concern = Concern.new
	end

	def create
		@concern = Concern.new(concern_params) 
		if @concern.save
			redirect_to user_concern_path(current_user, @concern)
		else
			render 'new'
		end
	end

	def show
		@concerns = Concern.find( params[:id] )
	end

private
  def concern_params
    params.permit(:to_number)
  end

end