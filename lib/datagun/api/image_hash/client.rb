# frozen_string_literal: true

module Datagun
  module Api
    #
    # ImageHash class for Datagun
    #
    module ImageHash
      #
      # Client provides methods to interact with image_hash endpoints
      #
      class Client < Base
        def initialize(default_logger: nil, version: Datagun.configure.api_version)
          super(default_logger: default_logger, version: version)
          base_url = "https://api.datagun.ai/api/v1/image_hash"
          @client = HttpWrapper.new(base_url: base_url)
        end

        def perceptual(url:)
          client.endpoint = 'perceptual'
          client.payload = {
            url: url
          }
          res = client.get
          res.transform_keys(&:to_sym)
        end
      end
    end
  end
end
