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

### Example scenario

User: Open honk for help. <br />
Alexa: Hello, what kind of service may I help you with today? You can pick from fuel, lockout, and tow. 

User: Tow. <br />
Alexa: Tow service price is 75$, ETA is 15 minutes. Would you like to continue with tow service?

User: Yes, please. <br />
Alexa: OK, you're in Los Angeles, California. Your zipe code is: 90064.. (and tells the user about found addresses. Allows user to pick a listed address or add a custom address.)

User: Add custom address <br />
Alexa: OK, what is your address?

User: My address is 2451 Barry Avenue <br />
Alexa: OK, your address is 2451 Barry Avenue.
