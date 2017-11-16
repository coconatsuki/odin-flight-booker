class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @from = @flight.from_airport.full_name
    @to = @flight.to_airport.full_name
    @from_code = @flight.from_airport.code
    @to_code = @flight.to_airport.code
    @passengers_count = params[:passengers]
    @passengers_count.to_i.times { @booking.users.build }
    render 'new'
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flight = Flight.find(params[:flight])
    if @booking.save
      @users = @booking.users
      @users.each do |user|
        PassengerMailer.thank_you_email(user).deliver_now!
      end
      redirect_to @booking
    else
      flash[:warning] = "You made a mistake. Try again."
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @passengers = @booking.users
    @flight = @booking.flight
  end

  private

  def booking_params
    params.require(:booking).permit( :flight, { users_attributes: [:name, :email, :passport, :gender] })
  end
end
