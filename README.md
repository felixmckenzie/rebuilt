# README

# Rebuilt 

## Identification of the problem to solve by building this particular marketplace app.
ReBuilt is a marketplace that seeks to help those affected by extreme weather events by offering them a platform to buy and sell recycled, new and unused building materials in an effort to help them get back on their feet, albeit with limited financial resources. 

## Why is it a problem that needs solving?
Extreme weather events continue to increase in frequency. The severe floods in 2022 destroyed countless homes in Northern NSW and Southern Queensland. The flooding not only affected homes, but incomes as well as many businesses were left decimated or no longer operable with the extreme weather destroying shopfronts and offices. 

The crisis has been made worse further, with a shortage of new building materials stemming from supply chain disruptions and labor shortages in the building industry from the Covid 19 pandemic. Moreover, population growth in recent years has led to a significant amount of new houses being constructed, further contributing to the supply shortage. However, increased building activity has also resulted in an increase in leftover/unused building materials, which until ReBuilt, often ended up in landfill. 

## Link to deployed app

## Link to Github

## Description of your marketplace app (website)

### Purpose 
A marketplace for recycled, secondhand and unused building materials specifically for people rebuilding their homes after natural disasters/extreme weather events. 

### Functionality / Features 

#### User Sign up / Sign In Authentication 
Rebuilt leverages the Devise gem for authentication. Users are able to sign up to the app with a username, password and email. User credentials are strongly encrypted, and when their session ends they will be prompted to sign in again to prove who they are. Guest users (Those who have not signed up) are able to view the homepage that presents all available listings, however to visit a specific listing for more detail and functions, users are required to be signed in. Devise allows the application to correctly ensure a user is signed in before attempting to perform an action, while also allowing the application to easily identify who that user is in the session. This is achieved through the Devise filter and helper methods i.e. authenticate_user!, user_signed_in? and current_user. 

#### Authorisation for Actions 
Rebuilt only exposes users to actions that they are authorised to perform. For example, if you are the seller (person who the listing belongs to) Your user interface for your listing will display buttons to edit or delete the listing, as well as a path to all the conversations with other users. Conversely, if you are a buyer (person who is signed in and not the seller of a post) a listing will display buttons to buy the listing and also a button to add the listing to your personal watchlist. A buyer will also have a button that allows them to message the seller. Authorisation functionality is achieved through the CanCanCan gem, which provides helper methods to identify who can manage the listing and who can buy it. 

#### Save Listings to a Watchlist 
Users have the ability to save a post to a personal watchlist so they can easily retrieve it at a later date. The watchlist function also allows users to see how many other users are watching a listing, which may encourage them to buy it. Users can easily remove a listing from their watchlist, or buy the item for sale.  

#### In App Messaging 
Users are able to message each within the application which allows further inquiry on a listing to be conducted quickly and easily. 

#### Filter and Search Listings 
A search bar on the home page provides users with the ability to search for a specific title of a listing and also to filter the search by category. 
 
#### Checkout and Pay Online with Stripe 
Stripe integration provides a safe and secure way to checkout and pay online with a credit card, this avoids the need for Rebuilt to capture any user card credentials. Upon purchase the user will be directed to a success page where they will be provided with the seller's address to pick up their purchase. 

### Sitemap 
![site-map](./images/sitemap-rebuilt.png)


## Tech Stack 

#### Core Technologies Used in Development
- HTML
- Bootstrap 4.5 (CSS)
- Ruby 2.7
- Ruby On Rails 6.1.6
- PostgresQL
- Git 
-Github

#### Gems Added To Project 
- Devise
- Bootstrap
- Jquery
- Simple Form
- Stripe 
- Can Can Can 
- Kramdown 
- Ransack
- Enum Help 
- AWS-S3

#### Deployment
- Heroku 

#### Third Party Services 
- Amazon Web Services 
- Stripe 


#### Target Audience
Th target audience of this application are those building or renovating a home with a focus on those who have been affected by extreme weather events. Rebuilt is also targeted at those working in the building industry and those who have recently built a home to encourage them to on sell their unwanted building materials 


## Screenshots 




## User Stories 
As Jim, a potential buyer. I want to be able to browse listings without signing up and filter the listings by keywords to see if the application has the type of materials I need.

As Susan, I’ve browsed the application and decided I want to make a purchase. I want to easily sign up to the application and keep my user credentials secure. 

As Tim, a plasterer, I often have leftover gyprock sheets after a build. I want an online application where I can post a listing and let potential buyers know how much I have, the price and the condition. 

As Mary, a recent renovator, I have lots of leftover tiles from my renovation. I want to upload photos to the application, so potential buyers can see if the tiles would suit their home. 

As John, a new home owner, we have lots of excess paint from building our house. I want to list the items, but also, edit the price if it doesn’t sell quickly enough. 

As Emma, a homeowner whose kitchen was recently destroyed by flooding, I need kitchen cabinets of a particular size to fit the space. Before I commit to purchasing cabinets from the application I’d like to be able to message the seller in the application to see if the dimensions are correct. 

As Tom, a recent seller, I want to delete all the items from the application that I have sold so others don't inquire. 

As Russel, a buyer. I want to be able to save listings to a watchlist to compare potential purchases before I commit to buying. 

As Jane, a buyer. I want the option to pay online using a credit card in a safe and secure way. 

## Wireframes 

### Homepage
![Home-Page](./images/Home-Page.png)
![Home-Page-Tablet](./images/Home-Page-Tablet.png)
![Home-Page-Mobile](./images/Home-Page-Mobile.png)
### Show Listing Page
![Show-Page](./images/Show-Listing-Page.png)
![Show-Page-Tablet](./images/Show-Listing-Tablet.png)
![Show-Page-Mobile](./images/Show-Listing-Mobile.png)
### Sign Up Form
![Sign-Up-Form](./images/Sign-Up-Form.png)
### User Watchlist
![Watchlist](./images/User-Watchlist.png)
![Watchlist-Tablet](./images/Watchlist-tablet.png)
### Messages Page
![Messages](./images/Messages.png)








