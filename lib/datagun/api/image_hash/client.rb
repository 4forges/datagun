# frozen_string_literal: true

module Datagun
  module Api
    #
    # Base class for Datagun
    #
    module ImageHash
      #
      # Client provide an HttpWrapper object that let
      #
      class Client < Datagun::Base
        def initialize(default_logger: nil, version: Datagun.config.api_version)
          super(default_logger: default_logger, version: version)
          base_url = "#{@api_url}/api/#{@version}/image_hash"
          @client = HttpWrapper.new(base_url: base_url)
        end

        def perceptual(url:)
          client.endpoint = 'perceptual'
          client.payload = {
            url: url
          }
          client.get.transform_keys(&:to_sym)
        end
      end
    end
  end
end
