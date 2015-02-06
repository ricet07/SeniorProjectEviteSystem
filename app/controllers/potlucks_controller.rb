class PotlucksController < ApplicationController
  # GET /potlucks
  # GET /potlucks.json
  def index
    @potlucks = Potluck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @potlucks }
    end
  end

  # GET /potlucks/1
  # GET /potlucks/1.json
  def show
    @potluck = Potluck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @potluck }
    end
  end

  # GET /potlucks/new
  # GET /potlucks/new.json
  def new
    @potluck = Potluck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @potluck }
    end
  end

  # GET /potlucks/1/edit
  def edit
    @potluck = Potluck.find(params[:id])
  end

  # POST /potlucks
  # POST /potlucks.json
  def create
    @potluck = Potluck.new(params[:potluck])

    respond_to do |format|
      if @potluck.save
        format.html { redirect_to @potluck, notice: 'Potluck was successfully created.' }
        format.json { render json: @potluck, status: :created, location: @potluck }
      else
        format.html { render action: "new" }
        format.json { render json: @potluck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /potlucks/1
  # PUT /potlucks/1.json
  def update
    @potluck = Potluck.find(params[:id])

    respond_to do |format|
      if @potluck.update_attributes(params[:potluck])
        session[:letin] = "ok"
        format.html { redirect_to :back, notice: 'Thanks for helping out. The host will be notified that you are bringing '+ @potluck.item + '.'  }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @potluck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /potlucks/1
  # DELETE /potlucks/1.json
  def destroy
    @potluck = Potluck.find(params[:id])
    @potluck.destroy

    respond_to do |format|
      format.html { redirect_to potlucks_url }
      format.json { head :no_content }
    end
  end
end
