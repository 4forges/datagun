# frozen_string_literal: true

module Datagun
  module Api
    #
    # KeywordsExtractor class for Datagun
    #
    module KeywordsExtractor
      #
      # Client provides methods to interact with keywords_extractor endpoints
      #
      class Client < Base
        def initialize(default_logger: nil, version: Datagun.config.api_version)
          super(default_logger: default_logger, version: version)
          base_url = "#{@api_url}/api/#{@version}/keyword_extractor"
          @client = HttpWrapper.new(base_url: base_url)
        end

        #
        # Store your corpus file
        #
        # @param [String] name: model name
        # @param [Integer] features: max number of features to extract from the corpus
        # @param [File] file
        #
        # @return [JSON]
        #
        def save_model(name:, features: nil, file:)
          client.endpoint = 'save_model'
          client.payload = {
            model_name: name,
            file: file
          }
          client.payload[:max_features] = features unless features.nil?
          client.post.transform_keys(&:to_sym)
        end

        #
        # Get status for a model_id
        #
        # @param [String] model_id
        #
        # @return [JSON]
        #
        def status(model_id:)
          client.endpoint = 'status'
          client.payload = {
            model_id: model_id
          }
          client.get.transform_keys(&:to_sym)
        end

        #
        # Return the list of keywords extractors models
        #
        # @return [JSON]
        #
        def models
          client.endpoint = 'models'
          client.get.map { |item| item.transform_keys(&:to_sym) }
        end

        #
        # Delete a model
        #
        # @return [JSON]
        #
        def delete(model_id:)
          client.endpoint = model_id
          client.delete.transform_keys(&:to_sym)
        end

        #
        # Extract top keywords from passed text using your model
        #
        # @param [String] model_id
        # @param [String] text
        #
        # @return [JSON]
        #
        def analyze(model_id:, text:)
          client.endpoint = 'analyze'
          client.payload = {
            model_id: model_id,
            text: text
          }
          client.get.transform_keys(&:to_sym)
        end
      end
    end
  end
end
