# Fly Challenge
Take home exercise for rails candidates

You are given the data for a set of missions. Each mission consists of  a set of photos.
You are to read the mission data and display information in a single page UI

The data is int he ```./data``` folder.

1. Create a DB schema for a mission that has a set of photos
1. Create a background job that reads teh data and for each mission
    1. Extract Latitude, Longitude, Altitude from the image EXIF data 
    1. Display Name, Latitude, Longitude, Altitude and size of each photo
    1. Add ability to sort photos by size and name
1. Add unit tests as needed
1. Bonus: Display a thumbnail of each photo

## Setup
- Install ruby ```2.7.2```
- Install postgresql, see: https://gist.github.com/ibraheem4/ce5ccd3e4d7a65589ce84f2a3b7c23a3
- To extract EXIF data from a photo you can use https://github.com/remvee/exifr or your any other 
library you prefer
- Create DB
```shell script
createdb fly_challenge_development
```

## Run
```shell script
yarn install
bundle exec rails server
```

## Run the test suite
```shell script
bundle install
bundle exec rake db:seed
bundle exec rake db:test:prepare
bundle exec rspec
```
