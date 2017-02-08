require 'hashie'
require 'active_support'
require 'active_support/core_ext'

module Tenk
  # The base class for all API resources
  class Resource
    # Initialize a base API resource from the client
    def initialize(client)
      @_client = client
    end

    # The root for this resource. Default is based on class name tableized
    # @return [String] the root url for actions on this resource
    def resource_root
      "/#{self.class.name.demodulize.tableize}"
    end

    # The base method for list requests on all resources
    def list(options)
      @_client.get(resource_root, options)
    end

    # The base method for get requests on all resources
    def get(id, options)
      @_client.get("#{resource_root}/#{id}", options)
    end

    # The base method for create requests on all resources
    def create(options)
      @_client.post(resource_root, options)
    end

    # The base method for update requests on all resources
    def update(id, options)
      @_client.put("#{resource_root}/#{id}", options)
    end
  end
end
