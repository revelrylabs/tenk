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

    def resource_root(project_id)
      "/projects/#{project_id}/#{self.class.name.demodulize.tableize}"
    end

    def list(project_id, options)
      @_client.get(resource_root(project_id), options)
    end

    def get(project_id, id, options)
      @_client.get("#{resource_root(project_id)}/#{id}", options)
    end

    def create(project_id, options)
      @_client.post(resource_root(project_id), options)
    end

    def update(project_id, id, options)
      @_client.put("#{resource_root(project_id)}/#{id}", options)
    end

    def delete(project_id, id)
      @_client.delete("#{resource_root(project_id)}/#{id}")
    end
  end
end
