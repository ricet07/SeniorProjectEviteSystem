class EventsController < ApplicationController

  before_filter :require_login
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @guests = Guest.all
    @locations = Location.all
    @potluck = Potluck.all

      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @potlucks = Potluck.all
    temp = current_user.id
    t = current_user.email

    @locations = Location.all
   
    @event = Event.new(:user_id => current_user.id, :hostEmail => current_user.email)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @guests = Guest.all
    @potlucks = Potluck.all
    @locations = Location.all
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @guests = Guest.all 
    @potlucks = Potluck.all
   

    respond_to do |format|
      if @event.save
         @location = Location.new(:address => @event.address + "," + @event.city + "," + @event.state + "," + @event.zip, :event_id => @event.id)
         @location.save
         @guest = Guest.new(:email => @event.hostEmail, :event_id => @event.id)
         @guest.save
        format.html { redirect_to @event, notice: 'Event was successfully created.'}
        format.json { render json: @event, status: :created, location: @event }
#       @guests.each do |guest|
#       if @event.id == 32
#          Notifier.invited(guest).deliver
#      end
#    end
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end



  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    @guests = Guest.all
    @locations = Location.all

    respond_to do |format|
      if @event.update_attributes(params[:event])  
          @guests.each do |guest|
           if guest.event_id == @event.id
            Notifier.invited(guest, @event).deliver   
           end 
          end 
        format.html { redirect_to @event, notice: 'Event is successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

end
