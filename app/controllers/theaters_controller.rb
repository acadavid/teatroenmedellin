class TheatersController < ApplicationController
  # GET /theaters
  # GET /theaters.json
  def index
    @theaters = Theater.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @theaters }
    end
  end

  # GET /theaters/1
  # GET /theaters/1.json
  def show
    @theater = Theater.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @theater }
    end
  end

  # GET /theaters/new
  # GET /theaters/new.json
  def new
    @theater = Theater.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @theater }
    end
  end

  # GET /theaters/1/edit
  def edit
    @theater = Theater.find(params[:id])
  end

  # POST /theaters
  # POST /theaters.json
  def create
    @theater = Theater.new(params[:theater])

    respond_to do |format|
      if @theater.save
        format.html { redirect_to @theater, notice: 'Theater was successfully created.' }
        format.json { render json: @theater, status: :created, location: @theater }
      else
        format.html { render action: "new" }
        format.json { render json: @theater.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /theaters/1
  # PUT /theaters/1.json
  def update
    @theater = Theater.find(params[:id])

    respond_to do |format|
      if @theater.update_attributes(params[:theater])
        format.html { redirect_to @theater, notice: 'Theater was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @theater.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theaters/1
  # DELETE /theaters/1.json
  def destroy
    @theater = Theater.find(params[:id])
    @theater.destroy

    respond_to do |format|
      format.html { redirect_to theaters_url }
      format.json { head :no_content }
    end
  end
end
