## deploy
* heroku login
* heroku create [NAME]
* git push heroku master
* heroku config:set READER_SERVER_API_URL=http://example.com/api
* heroku run rake db:migrate
* heroku run rake synchronize:all