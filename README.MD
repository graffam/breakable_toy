[![Build Status](https://travis-ci.org/graffam/breakable_toy.svg?branch=master)](https://travis-ci.org/graffam/breakable_toy) [![Code Climate](https://codeclimate.com/github/graffam/breakable_toy.png)](https://codeclimate.com/github/graffam/breakable_toy) [![Coverage Status](https://coveralls.io/repos/graffam/breakable_toy/badge.png)](https://coveralls.io/r/graffam/breakable_toy)



Ruby version


Configuration


How to run the test suite


Deployment instructions:
  If deploying on heroku, follow the heroku documentation for deploying a rails
  4 application (https://devcenter.heroku.com/articles/getting-started-with-rails4).

  * Git clone this repo
  * If you do not already have bundler, install bundler gem file
  * Type bundle install in the cloned directory in the terminal
  * rake db:migrate
  * rake db:seed
  * rails s to start the server

History:

January 11, 2015:
* Added tests for creation and viewing orders
* Added reagent ordering and viewing
* Added User authentication requirements for viewing and placing orders
* Added model tests for orders

January 12, 2015:
* Added history to README
* Moved reagent ordering forms into their own partial
* Added tabled sorting with table-sort jquery library
* Added cost objects table
* Added basic CSS

January 13, 2015:
* Added error messages for creating an order
* Added Updating Orders
* Added lot numbers to kit_orders

January 14, 2015:
* Added Admin name space
* Added Admin deleting and updating user accounts
* Added Admin deleting orders
January 15, 2015:
* Added styled side navigation bar
* Started work on styled ordering page
January 16, 2015:
* Finished styling of ordering page
* Styling for order details page
* Changed sign in page styling
* Makes root path homes#index
January 17, 2015:
* Added styling to many pages
January 19th:
* Gon Gem for javascript variable passing
* Chart.js for Bar graph of all
January 20th:
* Overhauled splash page design and styling
* Updated README.md with more information
