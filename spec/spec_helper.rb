require 'simplecov'

SimpleCov.start

require 'webmock/rspec'
require 'tenk'
require 'dotenv'
require 'vcr'

VCR.configure do |c|
  c.default_cassette_options = { record: :once, erb: true }
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<TENK_TOKEN>') { ENV['TENK_TOKEN'] }
end

Dotenv.load

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/{support,shared}/**/*.rb"].each { |f| require f }

client = Tenk.new api_base: 'https://vnext.10000ft.com/api/v1', token: ENV['TENK_TOKEN']

RSpec.configure do |config|
  config.include WebMock::API
  config.order = :rand
  config.color_enabled = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true

  config.before(:each) do
    WebMock.reset!
  end
  config.before(:each) do
    allow(Tenk).to receive(:new).and_return(client)
  end
  config.after(:each) do
    WebMock.reset!
  end
end
