require 'hashie'
require 'active_support'
require 'active_support/core_ext'

module Tenk
  # A base model for API resources nested under a user (/users/:id subresources)
  class Users::UserResource
    def initialize(client)
      @_client = client
    end

    def resource_root(user_id)
      "/users/#{user_id}/#{self.class.name.demodulize.tableize}"
    end

    def list(user_id, options)
      @_client.get(resource_root(user_id), options)
    end

    def get(user_id, id, options)
      @_client.get("#{resource_root(user_id)}/#{id}", options)
    end

    def create(user_id, options)
      @_client.post(resource_root(user_id), options)
    end

    def update(user_id, id, options)
      @_client.put("#{resource_root(user_id)}/#{id}", options)
    end

    def delete(project_id, id)
      @_client.delete("#{resource_root(project_id)}/#{id}")
    end
  end
end
