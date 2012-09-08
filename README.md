# Wax Museum

Let's make static pages have some live.

### What is this for? ...

This gem provides a simple and clean way to add static pages to your
application.

### ... and why's different from other alternatives?

**The content of the static pages is stored in a google doc document** that wax_museum
scraps and put inside your layout. So the content can be updated without
the need of database models or admin areas.

## Installation

Currently the gem only can be fetched from github. Add to Gemfile:

    gem 'wax_museum', git: 'git://github.com/recortable/wax_museum.git'

## Usage

Write the content of each static page in a google docs document. You
have to publish the document to retrieve the document id.

There are several ways to configure wax museum:

### 1. Using an initializer

Write an initializer:

    WaxMuseum.config do
      publish 'about', '1spk6wI4eD5WxvHgmUVaVcQLiReDo9pjPqPMUHN5Z3TI'
    end

### 2. Using a .yml file

Not ready yet.

## Generate routes

In your `routes.rb` file add the following line:

    WaxMuseum::Routes.draw

Remember the routes are order dependant, so where you put this line is
important.

With the above configuration, you will get a '/about' path that points
to the contents of the google document.

### Routes options

You can pass options to the Routes.write method:

    WaxMuseum::Routes.draw(prefix: 'info')

The options are:

- prefix: Add a path prefix to the route ('/info/about' instead of
'/about'). Defaults to ''
- cache: Perform fragment caching in the views. Defaults to true

## License

This is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
