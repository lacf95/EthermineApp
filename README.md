# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.4.2

* System dependencies

Before use the application you need to install some dependencies

- ImageMagick

we use [ImageMagick](https://www.imagemagick.org/script/index.php) for manipulate our images
resize, cut, and other things that the [Paperclip](https://github.com/thoughtbot/paperclip) gem use 

If you are using Linux, with this command:
```
sudo apt-get install imagemagick
```
For Mac OS X, it's recomendable use MacPorts, which custom builds ImageMagick in your enviroment,
use this command:
```
sudo port install ImageMagick
```
some users use the brew command
```
brew install imagemagick
```
For Windows users, you can dowload the .exe file Here: [Download Options](https://www.imagemagick.org/script/download.php)

- Postgresql

* Configuration


* Database initialization and Database creation

run this command:
```
rake db:setup
```

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

First you need log in in heroku, using in your terminal, you need to
be sure that you are in the application folder
```
heroku login
```
then you create an app on heroku running:
```
heroku create
```
and now you push your code to heroku
```
git push heroku master
```
the next step you need to migrate the dabase by running:
```
heroku run rake db:migrate
```
you can now visitn the app in your browser running:
```
heroku open
```
or you can get the URL of the app and visit in the browser running this command:
```
heroku apps:info
```
* License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
