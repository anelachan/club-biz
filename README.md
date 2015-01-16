## About

Club-Biz is a social application designed and built for a course in Software Modeling and Design. FYI, we were forced to name it "Club-Biz." Club-Biz enables students to interact with university clubs. Club administrators or officers can get added to the Club-Biz register. Once the club admin creates an account, the club can edit a club page, create events, advertise the event, make announcements, sell tickets and view reports on ticket sales. Students can create an account, follow clubs, reserve tickets, view messages from clubs and comment on event pages.

## Installation

To get the application up and running, the following is required:

* Install all necessary gems.
```
$ bundle update
$ bundle install 
```

* Load the database according to the definitive schema file (do not run all the migrations).
```
$ rake db:schema:load
```

* ImageMagick must be installed on the server for image uploading to work through the PaperClip gem. On a UNIX system with homebrew: 
```
$ brew install imagemagick
```

ACTUALLY ADDING CLUBS: Adding any registered clubs to the Club-Biz list (and no club account can be created without being checked against the list of registered clubs in the database) requires a SuperUser account. This can be created on the command-line.

The SuperUser needs the following information: 
last_name (string), first_name (string), password (string), password_confirmation (string)

In the rails console:
```
> me = SuperUser.new( 
	last_name: "your last name here", 
	first_name: "your first name here", 
	password: "password here", 
	password_confirmation: "password here"
   ).

> me.save
```

This will create a SuperUser account for you and you can now log in to add clubs to the official Registered Clubs database. This is purely to mimic the existence of a clubs administrator.

### Citations

Our code, especially CSS styles and the design of the Sessions and User classes and related, draws heavily from the Rails Tutorial book by Michael Hartl.

M. Hartl, Ruby on Rails Tutorial. Railstutorial.org, 2013. [E-book]. Available:
http://www.railstutorial.org/book/
