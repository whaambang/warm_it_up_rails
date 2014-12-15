# Warm It Up

[Production Link](http://192.241.154.25/)

Gamification of warmup exercises at the [Turing School of Software and Design](http://turing.io).  Complete warmups with your posse (groups of roughly 4 students), earn points, and upvote solutions from your peers.
    
Students can:

* Login with GitHub
* View the current day's exercise
* Run code against the server to verify correctness
* Submit a solution for points
* Browse and upvote solutions from other students
* Solutions receive points for correctness as well as number of upvotes


It's an Ember.js front end supported by a Rails back end.  Currently [Project Euler](https://projecteuler.net/) is supported and problems rotate automatically on a daily basis.  Future plans are to support LSAT problems, [exercisms](http://www.exercism.io/), and custom problems such as implementing Enumerable methods like `flatten`.  If any Turing students are feeling particularly brave and true we are always accepting PR's!

## Major Features

#### Scores

Scoring is on a per-posse basis.  Solutions recieve points based on when they were submitted - earlier submissions will receive more points.  All solutions receive a base score of 200.  Solutions also receive 50 points per upvote from other students, where each student (not posse) can vote once per solution.  Here you can see total points for each posse and live updates for newly submitted solutions.

#### Problems

![problems screenshot](http://i.imgur.com/r9VKtNC.png)

Each day there will be new problem from Project Euler displayed on this page.  Type in your solution and use the run button to check against the server.  You'll get feedback on whether your solution was correct (Project Euler was straightforward on this front as answers are numeric), and finally you can submit your solution for points.

#### Solutions

![solutions screenshot](http://i.imgur.com/bRQai9H.png)

Here students can browse and vote on solutions submitted by their peers.  We decided it was best to use humans to judge the 'correctness' or quality of a particular solution instead of computer based metrics like line and method length.  

## Installation

For Ember you will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* [Node.js](http://nodejs.org/) (with NPM) and [Bower](http://bower.io/)

You've found yourself in the Ember component of Warm It Up, which serves content to our front end and deals with persistent data.  For convenience there will be full local installation instructions in both README's (Ember and Rails, you can find the Rails application [here](https://github.com/whaambang/warm_it_up_rails).

To get everything up and running locally:

```
git clone git@github.com:whaambang/warm_it_up_ember.git
git clone git@github.com:whaambang/warm_it_up_rails.git

cd warm_it_up_ember
npm install && bower install

cd ../warm_it_up_rails
bundle
rake db:create db:migrate db:seed

# Running servers

# From within warm_it_up_rails/
bundle exec rails server

# From within warm_it_up_ember/
ember server -proxy http://localhost:3000 # or whatever port you plan on running the Rails server
```

To import problems (around 480 of them), run `rake import` from the Rails directory.  You'll need to have [Redis](http://redis.io/) and [Sidekiq](https://github.com/mperham/sidekiq) installed and running.  If you just want to tinker this might be overkill, and if desired you can always add problems from the Rails console.

At this point you can point your browser to `http://localhost:4200` and everything should be running smoothly.

### Running Tests

* `ember test`
* `ember test --server`

### Building

* `ember build` (development)
* `ember build --environment production` (production)

## Wish List of things to Implement

* Refactor to use a current user controller instead of the current implementation
* Problem is only available right before the start of warmup time
* Admin for adding problems and students and managing posses
* Problems in multiple languages

## Further Reading / Useful Links

* ember: http://emberjs.com/
* ember-cli: http://www.ember-cli.com/
* Development Browser Extensions
  * [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
  * [ember inspector for firefox](https://addons.mozilla.org/en-US/firefox/addon/ember-inspector/)
