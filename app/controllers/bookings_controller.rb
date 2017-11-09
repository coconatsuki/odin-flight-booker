class BookingsController < ApplicationController
  def new
    @flight = params[:flight_id]
    @passengers = params[:passengers]
    render 'new'
  end
end
