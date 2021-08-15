# Requirements

* Ruby 3.0
* Bundler
* RSpec
* Good luck

# Setup

Install dependencies using `bundle install` command

# Project Structure

* `bin/` - all commands, that user can use
* `lib/` - all business logic for the parser
* `spec/` - all tests that check business logic
* `coverage/` - auto generated coverage report. You should see it after running test

# How to use

```bash
cat webserver.log | bin/parse

or 

bin/parse webserver.log
```

# How to check if code is ok

You can check code using rubocop tool and rspec:

```ruby
bin/rubocop
bin/rspec
```

# References

* https://ruby-doc.org/core-3.0.0/ARGF.html
* https://ruby-doc.org/core-3.0.0/Enumerable.html