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

        def tokenize(text:, language: nil, downcase:, remove_stopwords:)
          client.endpoint = 'tokenize'
          client.payload = {
            text: text,
            language: language,
            downcase: downcase,
            remove_stopwords: remove_stopwords
          }
          res = client.post
          res.is_a?(Hash) && res[:error].present? ? res : res.map { |item| item.transform_keys(&:to_sym) }
        end
      end
    end
  end
end
