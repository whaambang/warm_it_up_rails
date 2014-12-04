## Warm It Up Rails

This is the Rails API for "Warm it Up", a project designed to gameify warmups at the [Turing School of Software and Design](http://turing.io).

## Installation

* `git clone <repository-url>` this repository
* change into the new directory
* bundle
* rake db:creat db:migrate
* To populate database: rake import

## Running / Development

* 'rails server'
* `ember server --proxy http://localhost:3000`
* Visit your app at http://localhost:4200.

## Running Tests

'rspec'

## Deploying

The way we chose to implement deploying is to put the compiled ember into the rails public folder.
This can be accomplished by running the rake build task. If that does not work you can copy the commands into the command line one by one. The app is currently deployed to a vps using this method on a production branch.


## Wish List of things to Implement

* Refactor to use a current user controller instead of the current implementation
* Problem is only available right before the start of warmup time
* Admin for adding problems and students and managing posses
* Problems in multiple languages
