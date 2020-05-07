# Datagun

[![Build Status](https://travis-ci.org/4forges/datagun.svg?branch=master)](https://travis-ci.org/4forges/datagun)

A Ruby interface to the Datagun API.

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
    config.api_key = 'token'
    config.api_version = 'v1'
  end
```

### Top keywords

Define a client and you gen upload your corpus. You can list your models, check a single model status, delete a model and analyze your text.

```ruby
  client = Datagun::Api::KeywordsExtractor::Client.new

  client.save_model(name: 'italian', file: File.open('/Users/giovannelli/Desktop/models/it.csv'))
  # list models
  client.models

  # Get model status
  # model statuse: processin, ready, failed
  client.status(model_id: "model id")

  # Delete a model
  client.delete(model_id: "model id")

  # analyze your text getting keywords with scores
  client.analyze(text: "lorem ispum dolor sic amet", model_id: "model id")
```

### Community Detection

Define a client call detect

```ruby
  client = Datagun::Api::KeywordsExtractor::Client.new

  # Return a list of communities
  client.detect(graph: 'json')
```

### Image hash

Define a client and call perceptual

```ruby
  client = Datagun::Api::KeywordsExtractor::Client.new

  # Return a list of communities
  client.perceptual(url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/360px-Ruby_logo.svg.png')
```

# TODO
- Add tests to all clients methods

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/datagun.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
