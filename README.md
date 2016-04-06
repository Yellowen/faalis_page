# Faalis Page

**Faalis Page** is a `Faalis` plugin to create and manage web pages easily.

## Installation
Add the gem to your gem file with its rails-assets requirement:

```ruby

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap-treeview'
end

gem 'faalis-page'

# Database driver
# it's not possible to use this gem with sqlite
gem 'pg' # if you want to use it with postgres

# or

gem 'mysql2' # if you want to use it with mysql
```

Then install the migrations:

```bash
rails g faalis_page:install:migrations
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credit
![Yellowen](http://www.yellowen.com/images/logo.png)

**Faalis Page**  is maintained and funded by Yellowen. Whenever a code snippet is borrowed or inspired by existing code, we try to credit the original developer/designer in our source code. Let us know if you think we have missed to do this.


# License

**Faalis Page** is Copyright © 2014 Yellowen. It is free software, and may be redistributed under the terms specified in the LICENSE file.
