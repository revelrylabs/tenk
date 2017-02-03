require 'hashie'

require_relative './project_resource'

module Tenk
  # API methods for attaching and removing tags from a project
  class Projects::Tags
    # The valid parameters for a Tag list request
    class ListRequest < ::Hashie::Trash
      property :fields, default: ''
      property :per_page, default: 20
      property :page, default: 1
    end

    def initialize(client)
      @_client = client
    end

    def list(project_id)
      @_client.get("/projects/#{project_id}/tags")
    end

    def add(project_id, tag)
      @_client.post("/projects/#{project_id}/tags", value: tag)
    end

    def remove(project_id, tag_id)
      @_client.delete("/projects/#{project_id}/tags/#{tag_id}")
    end
  end
end
