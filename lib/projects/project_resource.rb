require 'hashie'
require 'active_support'
require 'active_support/core_ext'

module Tenk
  # A base class for subresources under a project (within a /projects/:id url
  # space)
  class Projects::ProjectResource
    def initialize(client)
      @_client = client
    end

    # The base route for subresources under this project
    # By default, infers this URL from the resource class name
    # @param project_id [Integer] the id of this project
    # @return [String] the base URL for the subresource
    def resource_root(project_id)
      "/projects/#{project_id}/#{self.class.name.demodulize.tableize}"
    end

    # The default implementation of list requests for project subresources
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def list(project_id, options)
      @_client.get(resource_root(project_id), options)
    end

    # The default implementation of get requests for project subresources
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def get(project_id, id, options)
      @_client.get("#{resource_root(project_id)}/#{id}", options)
    end

    # The default implementation of create requests for project subresources
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def create(project_id, options)
      @_client.post(resource_root(project_id), options)
    end

    # The default implementation of update requests for project subresources
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def update(project_id, id, options)
      @_client.put("#{resource_root(project_id)}/#{id}", options)
    end

    # The default implementation of delete requests for project subresources
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def delete(project_id, id)
      @_client.delete("#{resource_root(project_id)}/#{id}")
    end
  end
end
