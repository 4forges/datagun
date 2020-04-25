# frozen_string_literal: true

module Datagun
  module Api
    #
    # Base class for Datagun
    #
    class Base
      attr_reader :client, :logger

      API_URL = 'http://localhost:4000/api'
      #
      # Initialize Datagun::Base
      #
      # @param [Logger] default_logger
      # i.e. nil || Logger.new
      #
      def initialize(default_logger: nil, version:)
        @logger = default_logger || self.class.set_logger
        @version = version
      end

      #
      # Log to datagun.log file if Rails defined.
      #
      # @return [Logger]
      #
      def self.set_logger
        @log_to ||= if defined?(::Rails)
                      shift_age = 2
                      shift_size = 50 * 1024 * 1024
                      ::Logger.new("#{::Rails.root}/log/datagun.log", shift_age, shift_size)
                    else
                      ::Logger.new(STDOUT)
                    end

        # Debug level on IRB or if logger_level is present on Thread.current
        @log_to.level = defined?(IRB) ? Logger::DEBUG : Thread.current[:logger_level] || Logger::INFO
      end
    end
  end
end
