# frozen_string_literal: true

RSpec.describe Datagun::Configuration do
  before(:all) do
    Datagun.configure {}
  end

  it 'optional attributes is an array with specific values' do
    expect(Datagun::Configuration::OPTIONAL_ATTRS.sort).to eq(%i[api_url].sort)
  end

  it 'mandatory attributes is an array with specific values' do
    expect(Datagun::Configuration::MANDATORY_ATTRS.sort).to eq(%i[api_key api_version].sort)
  end

  it 'configuration attributes total is correct' do
    expect((Datagun::Configuration::OPTIONAL_ATTRS + Datagun::Configuration::MANDATORY_ATTRS).size).to eq(3)
  end

  it 'api_key not defined raise a configuration error' do
    expect { Datagun.config.api_key }.to raise_error(Datagun::ConfigurationError, 'Datagun api_key missing!')
  end

  it 'api_version not defined raise a configuration error' do
    expect { Datagun.config.api_version }.to raise_error(Datagun::ConfigurationError, 'Datagun api_version missing!')
  end

  it 'all config values are defined' do
    Datagun.configure do |config|
      config.api_key = 'FOO'
      config.api_version = 'v1'
      config.api_url = 'http://test.com'
    end
    expect(Datagun.config.api_key).to eq('FOO')
    expect(Datagun.config.api_version).to eq('v1')
    expect(Datagun.config.api_url).to eq('http://test.com')
  end
end
