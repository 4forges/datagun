# Datagun

[![Build Status](https://travis-ci.org/4forges/datagun.svg?branch=master)](https://travis-ci.org/4forges/datagun)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/datagun`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'datagun'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install datagun

## Usage

```ruby
  Datagun.configure do |config|
    config.api_key = 'b0135a41ef32e93f1aaae4c0b6f5a887ad01dd6a0a2155583e4e4d98fcca2d6d0f84b92d5dd252e2f3653582703f809be30bc1b5be4a6f983e3a1188eff75378'
    config.api_version = 'v1'
    config.api_url = 'http://localhost:6000'
  end

  client = Datagun::Api::KeywordsExtractor::Client.new
  client.save_model(name: 'italiano11', file: File.open('/Users/giovannelli/Desktop/models/it.csv'))
  client.models
  client.status(model_id: "d905ea2f-136a-45b3-b80d-002dce388d3d")
  client.delete(model_id: "9b7a3fd5-4b75-4b61-9099-ee5ab15eb835")
  client.analyze(text: "lorem ispum dolor sic amet", model_id: "9b7a3fd5-4b75-4b61-9099-ee5ab15eb835")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/datagun.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
