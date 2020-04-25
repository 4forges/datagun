# frozen_string_literal: true

module Datagun
  class ConfigurationError < StandardError; end

  #
  # Datagun configuration
  #

  class Configuration
    OPTIONAL_ATTRS = [].freeze
    MANDATORY_ATTRS = %i[api_key api_version].freeze

    attr_accessor(*MANDATORY_ATTRS)

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
