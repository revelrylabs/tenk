require 'hashie'
require 'active_support'
require 'active_support/core_ext'

module Tenk
  # A base model for API resources nested under a user (/users/:id subresources)
  class Users::UserResource
    def initialize(client)
      @_client = client
    end

    # The base route for subresources under this user
    # By default, infers this URL from the resource class name
    # @param user_id [Integer] the id of this user
    # @return [String] the base URL for the subresource
    def resource_root(user_id)
      "/users/#{user_id}/#{self.class.name.demodulize.tableize}"
    end

    # The default implementation of list requests for user subresources
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def list(user_id, options)
      @_client.get(resource_root(user_id), options)
    end

    # The default implementation of get requests for user subresources
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def get(user_id, id, options)
      @_client.get("#{resource_root(user_id)}/#{id}", options)
    end

    # The default implementation of create requests for user subresources
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def create(user_id, options)
      @_client.post(resource_root(user_id), options)
    end

    # The default implementation of update requests for user subresources
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def update(user_id, id, options)
      @_client.put("#{resource_root(user_id)}/#{id}", options)
    end

    # The default implementation of delete requests for user subresources
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def delete(user_id, id)
      @_client.delete("#{resource_root(user_id)}/#{id}")
    end
  end
end
