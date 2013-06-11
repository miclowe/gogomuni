class TransitsController < ApplicationController

  before_filter :store_location
  before_filter :authenticate_user!

  # GET /transits
  # GET /transits.json
  def index
    @transits = current_user.transits

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transits }
    end
  end

  # GET /transits/1
  # GET /transits/1.json
  def show
    @transit = Transit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transit }
    end
  end

  # GET /transits/new
  # GET /transits/new.json
  def new
    @transit = Transit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transit }
    end
  end

  # GET /transits/1/edit
  def edit
    @transit = Transit.find(params[:id])
  end

  # POST /transits
  # POST /transits.json
  def create
    @transit = Transit.new(params[:transit])
    @transit.user_id = current_user.id

    respond_to do |format|
      if @transit.save
        flash[:notice] = "Alert was successfully created"
        format.html { redirect_to :action => "index" }
        format.json { render json: @transit, status: :created, location: @transit }
      else
        format.html { render action: "new" }
        format.json { render json: @transit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transits/1
  # PUT /transits/1.json
  def update
    @transit = Transit.find(params[:id])

    respond_to do |format|
      if @transit.update_attributes(params[:transit])
        format.html { redirect_to @transit, notice: 'Transit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transits/1
  # DELETE /transits/1.json
  def destroy
    @transit = Transit.find(params[:id])
    @transit.destroy

    respond_to do |format|
      format.html { redirect_to transits_url }
      format.json { head :no_content }
    end
  end
end
