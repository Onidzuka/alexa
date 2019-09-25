### Requirements

- Ruby 2.6.4
- Google Geocoding api key

### Installation 

1. Clone git repository

2. Install required gems:
``bundle install``

3. Run server: 
``bundle exec rackup -p 9292``

3. Run pagekite: 
``python pagekite.py http://localhost:9292 changeme.pagekite.me``

### Link a skill with the app

1. Change endpoint in alexa developer console (can be pointed to pagekite or heroku)
