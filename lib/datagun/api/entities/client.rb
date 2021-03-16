# frozen_string_literal: true

module Datagun
  module Api
    #
    # Base class for Datagun
    #
    module Entities
      #
      # Client provide an HttpWrapper object that let
      #
      class Client < Base
        #
        # Client provides methods to interact with tokenizer endpoint
        #
        def initialize(default_logger: nil, version: Datagun.config.api_version)
          super(default_logger: default_logger, version: version)
          base_url = "#{@api_url}/api/#{@version}/ner"
          @client = HttpWrapper.new(base_url: base_url)
        end

        def analyze(text:)
          client.endpoint = 'analyze'
          client.payload = {
            text: text
          }
          res = client.post
          res.deep_symbolize_keys
        end
      end
    end
  end
end
