# frozen_string_literal: true

module Datagun
  module Api
    #
    # Base class for Datagun
    #
    module CommunityDetection
      #
      # Client provide an HttpWrapper object that let
      #
      class Client < Datagun::Base
        def initialize(default_logger: nil, version: Datagun.config.api_version)
          super(default_logger: default_logger, version: version)
          base_url = "#{@api_url}/api/#{@version}/community_detection"
          @client = HttpWrapper.new(base_url: base_url)
        end

        def detect(graph:)
          client.endpoint = 'lpa'
          client.payload = {
            graph: graph
          }
          client.post.map{transform_keys(&:to_sym)
        end
      end
    end
  end
end
