Chitter Challenge
=================

# Instructions
 - Clone the repo
 - run bundle

## Install database
 - $ brew install postgresql
 - brew services start postgresql
 To connect with postgress:
 - psql postgres
 - To create the database please refer to the CREATE_DATABASE.sql file in the DB folder

## Run your local server
 - run rackup 
 - open browser address http://localhost:9292/

## Security

### Passwords

Passwords are stored in database as bcrypt hashes. pgcrypto postgresql extension utilised for this

Features:
-------

```
User Stories

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

```

Technical Approach:
-----

Using integrated database  the `PG` gem and `SQL` queries. Information on how to set up the database can be accessed in the CREATE_DATABASE file.