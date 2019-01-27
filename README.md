# Simple Trello Integration

This application serves to test integrations with Trello.

## Getting Started

To get started, you will need to do the following:
1.) Clone the repo
2.) Install all dependencies
3.) Configure the ngrok endpoint under `config/environments/development.rb` under the option: `config.webhook_domain`
4.) Start the rails server: `rails s`
5.) Start the webpack development server: `bin/webpack-dev-server`
6.) Initialize the webhooks: `rails webhooks:initialize`

### Prerequisites
* Ruby 2.6.0
* yarn
* NodeJS

### Installation

1.) Clone the repo.
2.) Run ```bundle install``` to install all gem dependencies
3.) Install all required node packages by running `yarn`
4.) Configure the ngrok endpoint under `config/environments/development.rb` under the option: `config.webhook_domain`

## Running the tests

Automated tests are handled through RSpec.
All tests are located under the spec directory.
To run the tests:
```
bundle exec rspec
```

### Extra Thoughts

The webhooks presented a rather intersting problem, as one can only create webhooks with Trello using their API, and since I'm not currently using any form of database, it required a different way to set them up.
What the `webhooks:initialize` task does is, it makes a call to Trello's API to retrieve any existing webhooks, and if there are any present, it deletes them, and creates a new webhook, almost like resetting webhooks on server start.

# Questions

1.) The task took about 4 and a half hours to complete in total. My goal was to keep it under 4 hours, but unfortunately I lost time on set up and with spec creation, which took me much longer than expected.
2.) I would have looked to get automated tests on the frontend, using Jest or Jasmine, as well as spend more time on the styling of the application. I unfortunately didn't get that much done on that front.
