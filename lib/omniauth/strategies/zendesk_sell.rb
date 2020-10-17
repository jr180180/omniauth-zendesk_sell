require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class ZendeskSell < OmniAuth::Strategies::OAuth2
      option :name, "zendesk_sell"
      option :client_options, {
        site:          'https://api.getbase.com',
        authorize_url: 'oauth2/authorize',
        token_url:     'oauth2/token',
      }

      uid { raw_info['id'] }

      info do
        {
          name:  raw_info['name'],
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/v2/accounts/self').parsed['data']
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
