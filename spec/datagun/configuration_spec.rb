# frozen_string_literal: true

RSpec.describe Datagun::Configuration do
  before(:all) do
    Datagun.configure {}
  end

  it 'mandatory attributes is an array with specific values' do
    expect(Datagun::Configuration::MANDATORY_ATTRS.sort).to eq([:api_key].sort)
  end

  it 'configuration attributes total is correct' do
    expect((Datagun::Configuration::OPTIONAL_ATTRS + Datagun::Configuration::MANDATORY_ATTRS).size).to eq(1)
  end

  it 'api_key not defined raise a configuration error' do
    expect { Datagun.config.api_key }.to raise_error(Datagun::ConfigurationError, 'Datagun api_key missing!')
  end

  it 'all mandatory config values are defined' do
    Datagun.configure do |config|
      config.api_key = 'FOO'
    end
    expect(Datagun.config.api_key).to eq('FOO')
  end
end
