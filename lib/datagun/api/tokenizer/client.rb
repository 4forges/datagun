# frozen_string_literal: true

module Datagun
  module Api
    #
    # Base class for Datagun
    #
    module Tokenizer
      #
      # Client provide an HttpWrapper object that let
      #
      class Client < Base
        #
        # Client provides methods to interact with tokenizer endpoint
        #
        def initialize(default_logger: nil, version: Datagun.config.api_version)
          super(default_logger: default_logger, version: version)
          base_url = "#{@api_url}/api/#{@version}/tokenizer"
          @client = HttpWrapper.new(base_url: base_url)
        end

        def tokenize(downcase:, language: nil, minimum_length: 1, remove_emoji: false, remove_stopwords: false, text:)
          client.endpoint = 'tokenize'
          client.payload = {
            downcase: downcase,
            language: language,
            minimum_length: minimum_length,
            remove_emoji: remove_emoji,
            remove_stopwords: remove_stopwords,
            text: text
          }
          res = client.post
          res.deep_symbolize_keys
        end
      end
    end
  end
end
