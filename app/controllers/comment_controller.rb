class CommentsController < ApplicationController

	def create
		@event = Event.find(params[:event_id])
		@comment = @event.comments.create(params[:comment])
		redirect_to event_path(@event)
	end
end
