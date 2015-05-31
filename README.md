
##A Choose Your Own Adventure Web App built from Sinatra!

_Feel free to fork, modify, or do anything you want with this code._


StoryPath is a web app for people to write stories together collaboratively.
It has a large focus on the ridiculous nature of the random internet. We decided to embrace this!

###Getting Started

1. `bundle install`
2. `rake db:drop`, `rake db:create`, `rake db:migrate`

###The data

####Models
* A *User* is someone who can log in, create a *Story* or add a *Scene* to someone else's *Story*.
* A *Story* is the entry point to a tale. It points to its first *Scene*, and has the ability to hold tags for the whole collection of *Scenes*.
* A *Scene* is a single snippet of a *Story*. It contains a description and two choices. Each choice leads to another *Scene*. This provides the recursive relationship that makes this all possible.

####Relations
* *Users* have many *Stories*
* A *Story* belongs to one *User*
* *Stories* have many *Scenes*
* A *Scene* belongs to one *Story*

####Tables planned but not used:
* *Upvotes*



####Want to get a feel for how it works?
[Choose Your StoryPath!](http://storypath.herokuapp.com)

