# Win32SslInit

A quick executable gem to dump the windows trust store for roots into your ruby ssl directory and rehash them for you.
Fixes most common SSL issues involving gem or bundler, as well as faraday (rest-client uses this trick as well)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add win32_ssl_init

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install win32_ssl_init

## Usage

```cmd
> win32_ssl_init
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/win32_ssl_init. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/win32_ssl_init/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Win32SslInit project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/win32_ssl_init/blob/main/CODE_OF_CONDUCT.md).
