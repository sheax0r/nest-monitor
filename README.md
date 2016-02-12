# Nest::Monitor

I have a Nest. I really like it! However, I do not like my furnace.

My furnace sucks, and sometimes it doesn't actually heat the house. The solution is to 
stop and restart it - but the Nest will never do this, because it (justifiably) believes that
*leaving the furnace on* is a good way to heat the house.

This app is, someday, going to monitor the temperature, notice that the temperature is 
failing to rise, and then stop and restart the furnace when that happens.

Until that day comes, this app will just restart the furnace every hour.

(*Yes yes, I know I should just get the furnace fixed!*)

## Run it on Heroku!
```bash
# Create it
heroku apps:create nest-monitor

# Configure it
heroku config:set NEST_USER=<your-email>
heroku config:set NEST_PASSWORD=<your-password>

# Scale it
heroku scale:set web=0,worker=1

# Deploy it
git push heroku master

# Create the database
heroku addons:create heroku-postgresql:hobby-dev
heroku run bundle exec rake db:migrate

# Restart it
heroku restart
```


## Design

I'm using:

* Postgres for my database, because `heroku addons:create heroku-postgresql:hobby-dev` is so dang easy (and really, what other database would you want?)
* [Clockwork](https://github.com/tomykaira/clockwork) to run scheduled tasks.
* [Sucker Punch](https://github.com/brandonhilkert/sucker_punch) for running jobs. Using a redis-based system like Resque or Sidekiq is overkill for this one, none of my jobs are all that important.
* [Sinatra](https://github.com/sinatra/sinatra). Well, okay, there's no *actual web interface* yet. But when there is, I'll use sinatra!
* [Pry](https://github.com/pry/pry) for the console, because it's better than IRB.
* ActiveRecord because I'm used to it, and it does what I want it to.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/nest-monitor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
