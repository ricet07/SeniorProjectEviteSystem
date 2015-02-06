class CommentsController < ApplicationController

	def create
		@event = Event.find(params[:event_id])
		@comment = @event.comments.create(params[:comment])
		session[:letin] = "ok"
		redirect_to :back
	end
end
