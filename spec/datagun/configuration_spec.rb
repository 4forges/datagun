# frozen_string_literal: true

RSpec.describe Datagun::Configuration do
  before(:all) do
    Datagun.configure {}
  end

  it 'mandatory attributes is an array with specific values' do
    expect(Datagun::Configuration::MANDATORY_ATTRS.sort).to eq(%i[api_key api_version].sort)
  end

  it 'configuration attributes total is correct' do
    expect((Datagun::Configuration::OPTIONAL_ATTRS + Datagun::Configuration::MANDATORY_ATTRS).size).to eq(2)
  end

  it 'api_key not defined raise a configuration error' do
    expect { Datagun.config.api_key }.to raise_error(Datagun::ConfigurationError, 'Datagun api_key missing!')
  end

  it 'api_version not defined raise a configuration error' do
    expect { Datagun.config.api_version }.to raise_error(Datagun::ConfigurationError, 'Datagun api_version missing!')
  end

  it 'all mandatory config values are defined' do
    Datagun.configure do |config|
      config.api_key = 'FOO'
      config.api_version = 'vq'
    end
    expect(Datagun.config.api_key).to eq('FOO')
    expect(Datagun.config.api_version).to eq('v1')
  end
end
