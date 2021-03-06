shared_examples 'an oauth2 strategy' do
  describe '#client' do
    it 'should be initialized with symbolized client_options' do
      @options = { client_options: { 'authorize_url' => 'https://example.com' } }
      expect(subject.client.options[:authorize_url]).to eq('https://example.com')
    end
  end

  describe '#token_params' do
    it 'should include any token params passed in the :token_params option' do
      @options = { token_params: { foo: 'bar', baz: 'zip' } }
      expect(subject.token_params['foo']).to eq('bar')
      expect(subject.token_params['baz']).to eq('zip')
    end

    it 'should include top-level options that are marked as :token_options' do
      @options = { token_options: [:scope, :foo], scope: 'bar', foo: 'baz' }
      expect(subject.token_params['scope']).to eq('bar')
      expect(subject.token_params['foo']).to eq('baz')
    end
  end
end
