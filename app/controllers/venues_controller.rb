class VenuesController < ApplicationController

  before_filter :get_theater

  respond_to :html

  def new
    @venue = Venue.new
    respond_with @venue, @theater
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def create
    @venue = @theater.venues.build(params[:venue])

    if @venue.save
      redirect_to @theater, notice: "La sede fue creada exitosamente"
    else
      flash[:alert] = "No se pudo crear la sede"
      render :new
    end
  end

  def update
    @venue = Venue.find(params[:id])

    if @venue.update_attributes(params[:venue])
      redirect_to @theater, notice: 'La sede fue modificada exitosamente'
    else
      flash[:alert] = "No se pudo modificar la sede"
      render :edit
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to @theater, notice: "La sede fue eliminada exitosamente"
  end

  private

  def get_theater
    @theater = Theater.find(params[:theater_id])
  end
end
