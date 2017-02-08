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

    # Initialize a Tenk::Projects::Tag resource API wrapper for the given client
    def initialize(client)
      @_client = client
    end

    # List Tags for a single project
    # @param project_id [Integer] the id of the project
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Projects::Tags::ListRequest
    def list(project_id)
      @_client.get("/projects/#{project_id}/tags")
    end

    # Attach a tag to a project
    # @param project_id [Integer] the id of the project
    # @param tag [String] the string of the tag to attach
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def add(project_id, tag)
      @_client.post("/projects/#{project_id}/tags", value: tag)
    end

    # Remove a tag from a project
    # @param project_id [Integer] the id of the project
    # @param tag_id [Integer] the integer id of the tag
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def remove(project_id, tag_id)
      @_client.delete("/projects/#{project_id}/tags/#{tag_id}")
    end
  end
end
