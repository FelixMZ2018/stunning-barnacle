![Rubocop style](https://github.com/FelixMZ2018/stunning-barnacle/workflows/Linters/badge.svg)
![rspec API testing](https://github.com/FelixMZ2018/stunning-barnacle/workflows/Rails%20tests/badge.svg)
# README

# Dockerized Rails API Demo: 

For the dockerized version please check https://github.com/FelixMZ2018/stunning-barnacle-docker

Ruby Version: 3.0.0
Rails Version: 6.1.2
Database: Postgres 12.1

## API Documentation: 

can be found at https://www.notion.so/API-Demo-Documentation-76cb299bb3234cb4b170276143fc0821

## Startup

Requirements: 
Ruby 3.0.0 for the setup check https://www.ruby-lang.org/en/documentation/installation/ 
Rails 6 which can be installed by running `gem install rails`
Postgresql 12.1

To clone the repository localy `git clone ` and change into the repo folder `cd stunning-barnacle-docker`

Next install the gems by running `bundle install`

Create and initial the database by running
`rails db:create`
`rails db:migrate`
`rails -s` to start the for the server


## Testing

The API is using rspec to perform integration tests with a dedicated testing database, to start the testing run 
`bundle exec rspec spec/controllers/api/v1/messages_controller_spec.rb --format documentation`

Both rspec and rubocop as linter has been integrated into via github actions and run on every push or pull request

For a full list of test cases please check the documentation on Notion

## Usage

For a full API Documentation please see the Notion page

## Shutdown 

`ctr + c` shuts down the server
