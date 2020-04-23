# frozen_string_literal: true

module Datagun
  module Api
    #
    # Base class for Datagun
    #
    module KeywordsExtractor
      #
      # Client provide an HttpWrapper object that let
      #
      class Client < Datagun::Base

        def initialize(default_logger: nil)
          @client = HttpWrapper.new(url: )
          super(default_logger: default_logger)
        end
        #
        # <Description>
        #
        # @param [<Type>] file <description>
        # @param [<Type>] name <description>
        #
        # @return [<Type>] <description>
        #
        def save_model(file:, name:); end

        #
        # <Description>
        #
        # @param [<Type>] model_id <description>
        #
        # @return [<Type>] <description>
        #
        def status(model_id:); end

        #
        # <Description>
        #
        # @param [<Type>] model_id <description>
        # @param [<Type>] text <description>
        #
        # @return [<Type>] <description>
        #
        def analyze(model_id:, text:); end
      end
    end
  end
end
