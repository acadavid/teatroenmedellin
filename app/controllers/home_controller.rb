class HomeController < ApplicationController
  respond_to :html

  def index
    @date = params[:date].nil? ? Date.today : Date.parse(params[:date])
    @act_dates = ActDate.page(params[:page]).per(5).when(@date)

    @dates = (Date.today..@date+5).to_a

    respond_with @acts_date
  end

end