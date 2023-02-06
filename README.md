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
### config
Setup [config/initialize/omniauth.rb](config/initialize/omniauth.rb)

### Set up Twitter app
To use Twitter as authenticator, you need to set up an at [Twitter Developer Portal](https://developer.twitter.com/en/portal/dashboard).
Ensure you configure authentication settings:
![image](https://user-images.githubusercontent.com/1935211/217080572-d08717c3-fc6c-44d7-a5fa-b9f3894ce540.png)


### OS environment variables
Put Twitter secrets into OS environment variables:
```sh
export OMNIAUTH_PROVIDER_KEY="...key..."
export OMNIAUTH_PROVIDER_SECRET="...secret..."
```

### secrets.yml
Create [secrets.yml](config/secrets.yml)

### Create [SessionController](app/controllers/session_controller.rb)


## Database creation
```
rails generate model Movie title:string rating:string release_date:datetime
rails generate model Moviegoer name:string provider:string uid:string
rake db:migrate
```

* Database initialization
use [db/seeds.rb](db/seeds.rb) file and initiate the command:
```
rake db:seed
```

## 
