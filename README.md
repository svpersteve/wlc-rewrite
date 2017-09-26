# West London Coders

## Front End

### HTML

Start at the main layout that renders each page:
[app/views/layouts/application.html.erb](app/views/layouts/application.html.erb)

Anything inside <% %> is Ruby code, anything inside <%= %> is Ruby code that Rails will print out to the page.

e.g.

```
<% @members.each do |member| %> # Doesn't print anything, it's just the start of a loop
  <%= member.name %> # Prints each member's name
<% end %> # Closes the loop
```

`<%= yield %>` is all the content of the current page.

Where ever you see `<%= render partial: 'file-name' %>`, this is rendering the
contents of that file exactly where that line is called.

Sometimes you need to pass variables to the partial, especially if you're
calling a partial that's used in lots of different places. This is how that
looks:

`<%= render partial: 'file-name', locals: { member: @member } %>`

If you're not sure what a method does, e.g. `<%= avatar(@member) %>`, I would
search `def avatar` to find where it's defined, or in Sublime you can right
click and press 'Go to definition'.

### CSS

All the CSS is rendered from [app/assets/stylesheets/application.scss](app/assets/stylesheets/application.scss).

It's grouped into partials to make it easier to find styles. If the file isn't
listed here, it won't be accessible to Rails.

### JavaScript

Same for JavaScript, [app/assets/javascripts/application.js](app/assets/javascripts/application.js) calls all the JS
files it needs, so you can create a new one as I've done with
[app/assets/javascripts/application/menu.js](app/assets/javascripts/application/menu.js) and list it here.

## Controllers

These control what data the views can access by storing them in @instance
variables. If you're not sure what an @instance variable contains, check the controller.

## Models

These control what we can do with the data and the relations between them.

## Cloning locally

You'll need the following installed:
* Ruby, via a [Ruby version manager](https://github.com/rbenv/rbenv)
* [Rails](http://installrails.com/steps/choose_os)
* [Postgres](https://wiki.postgresql.org/wiki/Detailed_installation_guides)

Clone the repo:
`git clone https://github.com/svpersteve/wlcrails.git`

Change directory into the app:
`cd wlc-rewrite`

Install gems the app depends on:
`bundle install`

Initialise the databases:

`bundle exec rails db:create`

Add seed data:

`bundle exec rails db:seed`

Start the server:
`bundle exec rails server`

## Add your Meetup.com API key to .env

Create a .env file in the root directory.

Get your API key from meetup.com here: https://secure.meetup.com/meetup_api/key/

Enter it into .env like this:

```
MEETUP_API_KEY=YOUR_KEY
```
