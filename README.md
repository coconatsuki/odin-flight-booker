# odin-flight-booker
Project in Rails

This project is part of the online formation "The Odin Project".

If you want to try it, this is the HEROKU link (it might take some time to load) => https://odin-flight-booking.herokuapp.com/

Follow the link for instructions : https://www.theodinproject.com/courses/ruby-on-rails/lessons/building-advanced-forms?ref=lnav

The main goal of this 'flight-booker' exercise is to practice advanced forms (dropdown menus, radio buttons and nested submissions) and models in Rails.

- I had to create a search form where a user could enter the desired dates / airports.

- The user could then select a flight among the eligible ones.

- Then, he could enter all the passengers information in an other form.

- Finally, the user can enter the billing information. This was made possible with the 'Stripe' gem.

I also had to set up complex associations, so that I could get all the departing or arriving flights of an airport, and the origin and destination of each flight.
