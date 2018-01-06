class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    flash[:notice] = "Succesful payment"
    @booking = Booking.find(session[:booking_id])
    @booking.update(payed: true)
    @users = @booking.users
    @users.each do |user|
      PassengerMailer.thank_you_email(user).deliver_now!
    end
    redirect_to @booking

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
