# Using OmniAuth

This is a short example of how to use [OmniAuth](https://github.com/omniauth/omniauth)

Pre-requisites:

* I used ruby version: 2.7.7

## Gemfile
```
gem 'omniauth', '~> 1.9'
gem 'omniauth-twitter'
```
run `bundle install` (or `bundle update` if changing)

## Routes
Add the following routes to [routes.rb](config/routes.rb):
```
  get '/auth/:provider/callback' => 'sessions#create'
  get '/login' => 'sessions#new', :as => :login
  get '/logout' => 'sessions#destroy', :as => :logout
  get '/auth/failure' => 'sessions#failure'
```

## OmniAuth configuration
Setup [config/initialize/omniauth.rb](config/initialize/omniauth.rb)

## Database creation
```
rails generate model Movie title:string rating:string release_date:datetime
rails generate model Moviegoer name:string provider:string uid:string
rake db:migrate
```

* Database initialization
use (db/seeds.rb) file and initiate the command:
```
rake db:seed
```

## 
