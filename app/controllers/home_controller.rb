class HomeController < ApplicationController

	def index
		if current_user
		 redirect_to "/userhome"
		end
	end

# GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @guests = Guest.all
    @users = User.all
    @potluck = Potluck.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end
end
