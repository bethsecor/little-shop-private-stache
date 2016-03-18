# Private Stache

## Built with Ruby on Rails

### Authors
[Beth Secor](http://github.com/bethsecor), [Steve Olson](https://github.com/SteveOscar), [Dan Winter](https://github.com/danjwinter), [Lenny Meyerson](https://github.com/TheObtuseAutodidact)

This project was created as a part of the curriculum for the [Turing School of Software & Design](http://turing.io).

### Overview

This Rails application is an e-commerce store selling mustaches. It uses a session-based cart, authentication, and role-based authorization. An admin is able to perform CRUD functionality on the mustaches, categories, and orders.

### Live Version

You can find a live version of this application on Heroku at: [https://pure-bayou-1075.herokuapp.com/](https://pure-bayou-1075.herokuapp.com/)

### Setup

To set up a local copy of this project, perform the following:

  1. Clone the repository: `https://github.com/bethsecor/little-shop-private-stache.git`
  2. `cd` into the project's directory
  3. Run `bundle install`
  4. Run `rake db:create db:migrate db:seed` to set up the postgres database and seed it with users, orders, categories, and staches.
  5. Run the application in the dev environment by running `rails s`

### App Features

#### Users

Users can browse the staches available by category or view them all on one page. Each stache has an image, title, price, and description associated with it. Users can add any staches that are active to their cart. Users do not need to be signed in to browse the staches or add them to their cart. However, upon checkout, if a user is not signed in they will be asked to create an account or login before being allowed to check out. Users can also view any of their past orders and the order status.

#### Admins

Admins are the 'master user' of the site. An admin can add new staches and categories, as well as update or delete existing ones. They are also able to view and change the status of any order that has been placed through the site. Like a default user, they are also able to shop and place orders of their own.

#### Other Features

This app also has a very cool feature built by Dan Winter that allows a user to try on a mustache with the mustache camera. It uses their webcam to take a picture of them, overlays the mustache on their picture and shows them the result. This feature is unfortunately not available on Heroku, and has been taken down from production on digital ocean.
