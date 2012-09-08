# Wax Museum

Let's make static pages have some live.

### What is this for? ...

This gem provides a simple and clean way to add static pages to your
application.

### ... and why's different from other alternatives?

The content of the static pages is a google doc document that wax_museum
scraps and put inside your layout. So the content can be updated without
the need of database models or admin areas.

## Installation

Currently the gem only can be fetched from github. Add to Gemfile:

    gem 'wax_museum', git: 'http://github.com/recortable/wax_museum'

## Usage

Write the content of each static page in a google docs document. You
have to publish the document to retrieve the document id.

There are several ways to configure wax museum:

### 1. Using an initializer

Write an initializer:

    WaxMuseum.config do
      doc 'about', '1spk6wI4eD5WxvHgmUVaVcQLiReDo9pjPqPMUHN5Z3TI'
    end

### 2. Using a .yml file

## Generate routes

    WaxMuseum::Routes.write


## License

This is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
