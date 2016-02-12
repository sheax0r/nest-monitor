# Nest::Monitor

I have a Nest. I really like it! However, I do not like my furnace.

My furnace sucks, and sometimes it doesn't actually heat the house. The solution is to 
stop and restart it - but the Nest will never do this, because it (justifiably) believes that
*leaving the furnace on* is a good way to heat the house.

This app is, someday, going to monitor the temperature, notice that the temperature is 
failing to rise, and then stop and restart the furnace when that happens.

Until that day comes, this app will just restart the furnace every hour.

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

## Contributing

1. Fork it ( https://github.com/[my-github-username]/nest-monitor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
