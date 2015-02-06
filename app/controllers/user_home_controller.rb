class UserHomeController < ApplicationController


def index
    @users = User.all
    @events = Event.all
    @guests = Guest.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  
  end

end
