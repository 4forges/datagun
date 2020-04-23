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

        def initialize(default_logger: nil)
          @client = HttpWrapper.new(url: )
          super(default_logger: default_logger)
        end
      end
    end
  end
end
