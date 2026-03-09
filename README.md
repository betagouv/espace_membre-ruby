# espace_membre-ruby

This gem offers some glue (namely ActiveRecord models) around the
Espace-Membre database to allow writing simple Ruby apps around it.

## TODO

- [ ] allow configuration (database name)
- [X] restore RSpec
- [X] run the tests
- [X] distribute.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "espace_membre-ruby"
```

Then start having fun:

```ruby
EspaceMembre::User.without(:active_missions).last(10)
```
