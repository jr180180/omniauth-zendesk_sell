# Omniauth::ZendeskSell

See more information on the Zendesk Sell OAuth2 authentication at https://developers.getbase.com/docs/rest/articles/oauth2/introduction

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-zendesk_sell'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-zendesk_sell

## Setup

1\. Create an `omniauth.rb` initializer file and add this as provider:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :zendesk_sell,
           ENV['ZENDESK_SELL_CLIENT_ID'],
           ENV['ZENDESK_SELL_CLIENT_SECRET'],
           scope: 'read write profile'
end
```

Scope details can be found at: https://developers.getbase.com/docs/rest/articles/oauth2/introduction#scopes

2\. Add your callback route and whitelist while registering your app at https://app.futuresimple.com/settings/oauth/apps

Your callback route will look something like this: `https://your_domain.com/auth/zendesk_sell/callback`

3\. Start/restart your application and go to GET `https://your_domain.com/auth/zendesk_sell` to begin the authentication process.

4\. In your controller, use the following to get the callback request data:

```ruby
request.env['omniauth.auth']
```

Here's an example of the data structure returned from the request call above:

```ruby
{ "provider"    => "zendesk_sell",
  "uid"         => 11111,
  "info"        => { "name" => "your_account_name", "email" => nil },
  "credentials" =>
    { "token"         => "1237918237829",
      "refresh_token" => "1237918237829",
      "expires_at"    => 1237918237829,
      "expires"       => true },
  "extra"       =>
    { "raw_info" =>
        { "id"          => 11111,
          "name"        => "your_account_name",
          "time_format" => "12H",
          "timezone"    => "UTC-05:00",
          "created_at"  => "2020-01-11T11:11:11Z",
          "updated_at"  => "2020-11-11T11:11:11Z",
          "currency"    => "USD",
          "phone"       => "1111111111" } } }

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jr180180/omniauth-zendesk_sell. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jr180180/omniauth-zendesk_sell/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::ZendeskSell project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jr180180/omniauth-zendesk_sell/blob/master/CODE_OF_CONDUCT.md).
