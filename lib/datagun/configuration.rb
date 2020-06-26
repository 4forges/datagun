# frozen_string_literal: true

module Datagun
  class ConfigurationError < StandardError; end

  #
  # Datagun configuration
  #

  class Configuration
    OPTIONAL_ATTRS = %i[api_url].freeze

    attr_accessor(*OPTIONAL_ATTRS)

    MANDATORY_ATTRS = %i[api_key
                         api_version].freeze

    attr_accessor(*MANDATORY_ATTRS)

    #
    # Initialize Datagun::Configuration
    #
    def initialize
      @api_key = 'f1730d61ae270b2541c8696d3737be4a514f6a4bd0eb205e06c04f2c838bf1d1a58b23ae5f5ecb47d373413b802e40935e5180399ac4a2bade159ff0dd6e7fd3'
      @api_version = 'v1'
    end

    MANDATORY_ATTRS.each do |attr|
      define_method(attr) do
        attr_value = instance_variable_get("@#{attr}")
        if attr_value.nil? || attr_value.strip == ''
          raise ConfigurationError, "Datagun #{attr} missing!"
        end

        attr_value
      end
    end
  end
end
