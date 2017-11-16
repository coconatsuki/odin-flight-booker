class FlightsController < ApplicationController

  def new
  end

  def create

  end


  def index
    @flight = Flight.new
    @from_code = Airport.all.map { |f| [f.code, f.id] }
    @to_code = Airport.all.map { |f| [f.code, f.id] }
    @passengers = [[1], [2], [3], [4]]
    @date = Flight.all.order(:departure_date).map { |f| [f.departure_date.strftime("%d %B, %Y"), f.id] }
    @flights = Flight.accurate_flights(params[:from_id], params[:to_id]) if params[:commit]
    @passengers_number = params[:passengers] if params[:passengers]
  end
  #


end
