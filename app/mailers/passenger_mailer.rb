class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def thank_you_email(user)
    @user = user
    @last_booking = Flight.find(@user.bookings.last.flight_id)
    mail(to: @user.email, subject: 'Thank you for booking a flight with us !')
  end

end
