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

    def initialize(options = {}, &block)
      self.configuration = Configuration.new(options)
      self.logger = configuration.logger

      yield_or_eval(&block) if block_given?
    end

    def yield_or_eval(&block)
      return unless block
      block.arity > 0 ? yield(self) : instance_eval(&block)
    end

    def connection
      Faraday.new(url: configuration.api_base) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def request(url, method, url_opts = {})
      hashify_response(
        connection.send(method) do |req|
          req.url configuration.api_base + url, url_opts
          req.headers['Content-Type'] = 'application/json'
          req.headers['auth'] = configuration.token
        end,
      )
    end

    def get(url, url_opts = {})
      request(url, :get, url_opts)
    end

    def post(url, url_opts = {})
      request(url, :post, url_opts)
    end

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

    def put(url, url_opts = {})
      request(url, :put, url_opts)
    end

    def delete(url, url_opts = {})
      request(url, :delete, url_opts)
    end

    def users
      @_users ||= Tenk::Users.new(self)
    end

    def placeholder_resources
      @_placeholder_resources ||= Tenk::PlaceholderResources.new(self)
    end

    def projects
      @_projects ||= Tenk::Projects.new(self)
    end

    def time_entries
      @_time_entries ||= Tenk::TimeEntries.new(self)
    end

    def bill_rates
      @_bill_rates ||= Tenk::BillRates.new(self)
    end

    def approvals
      @_approvals ||= Tenk::Approvals.new(self)
    end

    def hashify_response(resp)
      return true if resp.body.empty?
      Hashie::Mash.new(JSON.parse(resp.body))
    end
  end
end
