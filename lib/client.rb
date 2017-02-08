require 'faraday'
require 'hashie'
require 'json'
require 'byebug'

require_relative './configuration'
require_relative './resource'
require_relative './placeholder_resources'
require_relative './time_entries'
require_relative './users'
require_relative './bill_rates'
require_relative './projects'
require_relative './approvals'

module Tenk
  # One client of the 10k API
  class Client
    attr_accessor :configuration
    attr_accessor :logger

    # Initialize a new Tenk client
    # @param options [Hash] configuration options for the client
    # @param block [Block] a block which will receive the new client as an arg
    # @see Configuration
    def initialize(options = {}, &block)
      self.configuration = Configuration.new(options)
      self.logger = configuration.logger

      yield_or_eval(&block) if block_given?
    end

    # If a block is given, invoke it with this client. If the block takes no
    # args, then just execute it as an instance of the client
    def yield_or_eval(&block)
      return unless block
      block.arity > 0 ? yield(self) : instance_eval(&block)
    end

    # The Faraday connection used by this client
    def connection
      Faraday.new(url: configuration.api_base) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    # Make a request to url, with a given method and options, and wrap the
    # response in a Hashie::Mash
    # @param url [String] the URL where to send the request
    # @param method [Symbol] the HTTP method to use to send the request
    # @param url_opts [Hash] the request payload, which will become query params
    # @return [Hashie::Mash] the API response wrapped in a Hashie::Mash
    def request(url, method, url_opts = {})
      hashify_response(
        connection.send(method) do |req|
          req.url configuration.api_base + url, url_opts
          req.headers['Content-Type'] = 'application/json'
          req.headers['auth'] = configuration.token
        end,
      )
    end

    # Make a GET request to the API
    # @param url [String] the URL where to send the request
    # @param url_opts [Hash] the request payload, which will become query params
    # @return [Hashie::Mash] the API response wrapped in a Hashie::Mash
    def get(url, url_opts = {})
      request(url, :get, url_opts)
    end

    # Make a POST request to the API
    # @param url [String] the URL where to send the request
    # @param url_opts [Hash] the request payload, which will become query params
    # @return [Hashie::Mash] the API response wrapped in a Hashie::Mash
    def post(url, url_opts = {})
      request(url, :post, url_opts)
    end

    # Make a POST request to the API and use url_opts as a body payload instead
    # of query params
    # @param url [String] the URL where to send the request
    # @param url_opts [Hash] the request payload, which will become the POST body
    # @return [Hashie::Mash] the API response wrapped in a Hashie::Mash
    def post_with_body(url, url_opts = {})
      hashify_response(
        get_connection.post do |req|
          req.url configuration.api_base + url
          req.body = JSON.generate(url_opts)
          req.headers['Content-Type'] = 'application/json'
          req.headers['auth'] = configuration.token
        end,
      )
    end

    # Make a PUT request to the API
    # @param url [String] the URL where to send the request
    # @param url_opts [Hash] the request payload, which will become query params
    # @return [Hashie::Mash] the API response wrapped in a Hashie::Mash
    def put(url, url_opts = {})
      request(url, :put, url_opts)
    end

    # Make a DELETE request to the API
    # @param url [String] the URL where to send the request
    # @param url_opts [Hash] the request payload, which will become query params
    # @return [Hashie::Mash] the API response wrapped in a Hashie::Mash
    def delete(url, url_opts = {})
      request(url, :delete, url_opts)
    end

    # Access the User resource using this client
    # @return [Tenk::Users] a Users API class
    def users
      @_users ||= Tenk::Users.new(self)
    end

    # Access the PlaceholderResources resource using this client
    # @return [Tenk::PlaceholderResources] a PlaceholderResources API class
    def placeholder_resources
      @_placeholder_resources ||= Tenk::PlaceholderResources.new(self)
    end

    # Access the Project resource using this client
    # @return [Tenk::Projects] a Projects API class
    def projects
      @_projects ||= Tenk::Projects.new(self)
    end

    # Access the TimeEntry resource using this client
    # @return [Tenk::TimeEntries] a TimeEntries API class
    def time_entries
      @_time_entries ||= Tenk::TimeEntries.new(self)
    end

    # Access the BillRates resource using this client
    # @return [Tenk::BillRates] a BillRates API class
    def bill_rates
      @_bill_rates ||= Tenk::BillRates.new(self)
    end

    # Access the Approvals resource using this client
    # @return [Tenk::Approvals] a Approvals API class
    def approvals
      @_approvals ||= Tenk::Approvals.new(self)
    end

    # Take a Farady response and turn it into a Hashie::Mash
    # @param resp [Faraday::Response] a response provided by Faraday
    # @return [Hashie::Mash] a Hashie::Mash version of the response body
    def hashify_response(resp)
      return true if resp.body.empty?
      Hashie::Mash.new(JSON.parse(resp.body))
    end
  end
end
