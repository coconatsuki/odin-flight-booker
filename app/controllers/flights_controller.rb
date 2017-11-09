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
    # @month = Date.today.month
    # @year = [[Date.today.year], [1.year.from_now.year]]
    @date = Flight.all.order(:departure_date).map { |f| [f.departure_date.strftime("%d %B, %Y"), f.id] }
    @flights = Flight.accurate_flights(params[:from_id], params[:to_id]) if params[:commit]
    @passengers_number = params[:passenger] if params[:passenger]
  end
  #
  # def accurate_flights(from_id, to_id)
  #   Flight.where("from_airport_id = ? AND to_airport_id = ?", from_id, to_id)
  # end


end
