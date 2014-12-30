class ActsController < ApplicationController

  respond_to :html

  before_filter :require_login, :except => [:index, :show]
  before_filter :set_theater

  def index
    @acts = @theater.acts
    respond_with @acts
  end

  def show
    @act = @theater.acts.find_by_id(params[:id])
    respond_with @act
  end

  def new
    @act = Act.new
    @act.act_dates.build
    respond_with @act
  end

  def edit
    @act = @theater.acts.find_by_id(params[:id])
  end

  def create
    @act = @theater.acts.new(act_params)
    
    if @act.save
      flash[:notice] = 'Act was successfully created.'
      respond_with(@theater, @act)
    else
      render action: :new
    end
  end

  def update
    @act = @theater.acts.find(params[:id])
    
    if @act.update_attributes(act_params)
      respond_with(@theater, @act)
    else
      render action: :edit
    end
  end

  def destroy
    @act = @theater.acts.find(params[:id])
    @act.destroy

    redirect_to theater_acts_path(@theater)
  end

  private

  def set_theater
    @theater = Theater.find(params[:theater_id]) if params[:theater_id].present?
  end

  def act_params
    params.require(:act).permit(:name, :description, :clasification, :price, :theater_id, :venue_id)
  end
end
