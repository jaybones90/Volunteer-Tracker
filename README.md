# Volunteer Tracker

This is a simple program that tracks which volunteers are working on what projects

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

Ruby 2.2.2
Bundler
postgres
psql



### Installing

 You can clone this repository to your machine, navigate to the file path in your terminal, and run 'app.rb' by typing '$ruby app.rb'. If you chose to clone the repository, after you run 'app.rb' you will need to copy the localhost path into your web browser. The standard localhost for Sinatra is port 4567.

 You will need to run the 'postgres' command in your terminal and then run the 'psql' command so that you have access to create a new database. Then you'll need to run the following commands in their respective orders:

 CREATE DATABASE volunteer_tracker;
 CREATE TABLE projects (id serial PRIMARY KEY, name varchar, description varchar);
 CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int);

 then to be able to run the tests, you'll need to run this command:

 CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;

The program should then be linked with the proper databases and run as expected

## Built With

* Ruby
* Sinatra
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* ES6
* Jquery https://jquery.com/

## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|

## Known Issues
* no known issues at this time


## Authors

* Jason Ainsworth

## License MIT

Copyright © 2017 Jason Ainsworth
