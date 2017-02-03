require 'logger'

module Tenk
  # Holds the configuration for a Tenk client (API key and base URL, and logger)
  class Configuration
    attr_accessor :token
    attr_writer :api_base
    attr_writer :logger

    def initialize(opts = {})
      opts.each do |key, value|
        send("#{key}=", value)
      end
    end

    def api_base
      @api_base || 'https://api.10000ft.com/api/v1'
    end

    def logger
      if @logger.blank?
        @logger = Logger.new(STDERR)
        @logger.level = Logger::WARN
      end

      @logger
    end
  end
end
