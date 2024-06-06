#  PizzaApp

PizzaApp is an application developed on SwiftUI for ordering pizza (BZ Fire Base)

The application consists of:
* Authorization screen
* User Interface
* Admin interface
***
### Authorization screen
The authorization screen has two states:
* Authorization
* Registration

<p align="center"><img width="250" src="https://github.com/pppinkyyy/PizzaApp/raw/main/docs/screenShot2.PNG"></p>

The state changes when the button is pressed.
This view has placeholders for entering your email and password, and a login button.
***
### User Interface
After successful registration, the user is taken to the user interface.
This interface consists of 3 views:
* User profile
* Menu
* Cart
***
#### Profile
In the Profile, the user can:
* add/change user avatar, username, phone number, delivery address
* monitor the history of all user orders, and the status of orders
* log out of user profile

<p align="center"><img width="250" src="https://github.com/pppinkyyy/PizzaApp/raw/main/docs/screenShot.PNG"></p>

***
#### Menu
Next is the Menu screen, which consists of two sections:
* Section "Popular pizzas" - horizontal scroll
* Section "All pizzas" - vertical scroll

Clicking on any pizza will open a view with details about this pizza.
In this view, the user can change the count and size of the pizza, and add pizza to the cart.
***
#### Cart
In the shopping cart the user can:
* Monitor the list of cart items
* Remove unnecessary item from cart
* Cancel order - remove all items from cart
* Order delivery
***
### Admin interface
Now let's move on to the Admin interface.
The admin screen displays a list of all orders.
After clicking on any order, a view with all the information about this order opens.
The admin has the ability to change the order status that the user is tracking.

There are also 3 buttons on the top of the admin screen:
* Button to exit the admin interface to the login screen
* Button to add a product, clicking on it opens a view in which the admin can add a new item (photo, name, description, etc.)
* Button to updates data.
