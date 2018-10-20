# README
### Setup
To clone this repository, run:

`$ git clone https://github.com/jmarsto/mock-coding-challenge.git`

cd into the repository:

`$ cd github_trending`

### Part I: Command Line Script
To get trending repositories data from the command line, run:

`$ ruby cli.rb`

### Part II: JSON API for trending repositories on GitHub
Run the following to install dependences:

```$ bundle
$ yarn```

Set up and seed the database:

`$ rake db:setup`

Start the development server:

`$ rails s`

Finally, navigate to [the API endpoint](http://localhost:3000/api/v1/repositories)!
