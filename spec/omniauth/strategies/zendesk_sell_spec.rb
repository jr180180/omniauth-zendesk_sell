require 'spec_helper'
require 'omniauth-zendesk_sell'

RSpec.describe OmniAuth::Strategies::ZendeskSell do
  let(:request) { double('Request') }
  let(:client_id) { 'foo' }
  let(:client_secret) { 'bar' }

  before :each do
    allow(request).to receive(:params).and_return({})
    allow(request).to receive(:cookies).and_return({})
  end

  subject do
    args = [client_id, client_secret, @options].compact
    OmniAuth::Strategies::ZendeskSell.new(nil, *args).tap do |strategy|
      allow(strategy).to receive(:request).and_return(request)
    end
  end

  it_should_behave_like 'an oauth2 strategy'

  it 'has a version number' do
    expect(Omniauth::ZendeskSell::VERSION).not_to be nil
  end

  describe '#client' do
    it 'should have the correct site' do
      expect(subject.client.site).to eq('https://api.getbase.com')
    end

    it 'should have the correct authorization url' do
      expect(subject.client.options[:authorize_url]).to eq('oauth2/authorize')
    end

    it 'should have the correct token url' do
      expect(subject.client.options[:token_url]).to eq('oauth2/token')
    end
  end

  describe '#callback_path' do
    it 'should have the correct callback path' do
      expect(subject.callback_path).to eq('/auth/zendesk_sell/callback')
    end
  end
end
