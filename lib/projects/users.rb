require 'hashie'

require_relative './project_resource'

module Tenk
  # API methods for Users resource under a project, which lists users tied to
  # a particular project
  class Projects::Users < ::Tenk::Projects::ProjectResource
    # Valid parameters for a list request of users of a project
    class ListRequest < ::Hashie::Trash
      property :fields, default: ''
      property :per_page, default: 20
      property :page, default: 1
    end

    # List Users for a single project
    # @param project_id [Integer] the id of the project
    # @param opts [Hash] the query parameters to add to list request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Projects::Users::ListRequest
    def list(project_id, opts = {})
      super(project_id, ListRequest.new(opts))
    end
  end
end
