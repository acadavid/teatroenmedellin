class HomeController < ApplicationController
  respond_to :html

  def index
    date = params[:date].nil? ? Date.today : Date.parse(params[:date])
    @acts_date = ActDate.when(date)

    @dates = (Date.today..date+5).to_a

    respond_with @acts_date
  end

end