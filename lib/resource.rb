require 'hashie'
require 'active_support'
require 'active_support/core_ext'

module Tenk
  # The base class for all API resources
  class Resource
    def initialize(client)
      @_client = client
    end

    def resource_root
      "/#{self.class.name.demodulize.tableize}"
    end

    def list(options)
      @_client.get(resource_root, options)
    end

    def get(id, options)
      @_client.get("#{resource_root}/#{id}", options)
    end

    def create(options)
      @_client.post(resource_root, options)
    end

    def update(id, options)
      @_client.put("#{resource_root}/#{id}", options)
    end
  end
end
