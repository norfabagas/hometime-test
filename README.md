# README
## Hometime test

#### Requirements:
- Ruby, Rails versions:
We need at least Ruby version 3.0.2 and Rails version 6.1.4, with Bundler version 2.2.25.

- Cloning Project
First, make sure your Ruby, Rails, and Bundler version are already satisfied.
Clone this project (git clone https://github.com/norfabagas/hometime-test.git).
Run `bundle install` to install all required libraries.
Create env file (by copying `.env.example` and rename it to `.env`) and fill in all required values.
Create database (`rake db:create`) and run migations (`rake db:migrate`).
Start rails server (`rails s`)

- ENV File
Copy and paste .env.example into .env file.
And fill in the Database name, username, password, host, port for development and testing environment.

- Database configuration
Run `rake db:create` to create the required databases (development and test).
And we need to run migration `rake db:migrate`.

- How to run the test suite
All unit tests are covered by RSpec.
To test all features, just run `bundle exec rspec`