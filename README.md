# Emmental

[![Build Status](https://travis-ci.org/s-osa/emmental.svg?branch=master)](https://travis-ci.org/s-osa/emmental)

Gem to build a sparse rectangle array.

## Installation

Add this line to your application's Gemfile:

    gem 'emmental'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emmental

## Usage

### Basic

```ruby
emmental = Emmental.new

emmental << {foo: 1, bar: 2}
emmental << {fizz: 3, "buzz" => 5}
emmental << {foo: 1}

emmental.to_a # =>
# [
#   [:foo, :bar, :fizz, "buzz"],
#   [1, 2, nil, nil],
#   [nil, nil, 3, 5],
#   [1, nil, nil, nil]
# ]
```

### Default headers

```ruby
emmental = Emmental.new(["a", "b", "c"])
```

### Array without headers

```ruby
emmental.to_a(headers: false)
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/emmental/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
