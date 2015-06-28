[![Build Status](https://travis-ci.org/engwebUM/projecto-g1.svg?branch=master)](https://travis-ci.org/engwebUM/projecto-g1) [![Code Climate](https://codeclimate.com/github/engwebUM/projecto-g1/badges/gpa.svg)](https://codeclimate.com/github/engwebUM/projecto-g1)

# Sponsors Management - Group 1

In this project we will develop Sponsors Management as primary goal.
As a second goal we have in perspective the development of operating
costs and revenues of the respective conference.

### Configuration

This section documents whatever steps are necessary to get the
application up and running. We assume that you already set up
your Ruby on Rails environment.

If you want to run our project from git you have to run the
following commands on your terminal:

1. Clone our project from github
`->git clone https://github.com/engwebUM/projecto-g1.git`

2. Change to projecto-g1 folder
`->cd projecto-g1`

3. Make sure all dependencies in your Gemfile are available
to the application
`->bundle install`

4. Create database, load the schema into the current env's
database and populate database
`->rake db:setup`

5. Launch a web server named WEBrick which comes bundled
with Ruby
`->rails server`

After you launch the Rails server (listening on port 3000) go to
your browser and open http://localhost:3000, you will see
our Rails app running.

### Heroku

Our application can also be seen in Heroku where its production
version is being timely deployed. Heroku is a platform as a
service (PaaS) that enables developers to build and run
applications entirely in the cloud.

The link that allows this view is as follows: [Sponsors Management](http://projectg1.herokuapp.com/)
