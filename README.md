# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.7.7

* System dependencies

* Configuration

* Database creation
```
rails generate model Movie title:string rating:string release_date:datetime
rake db:migrate
```

* Database initialization
use [db/seeds.rb] file and initiate the command:
```
rake db:seed
```

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
