require 'hashie'

require_relative './project_resource'

module Tenk
  # The API methods for Phases, which represent a part of a project with its own
  # budget and resources
  class Projects::Phases < ::Tenk::Projects::ProjectResource
    # The valid parameters for a Phase list request
    class ListRequest < Tenk::Projects::ListRequest; end

    # The valid parameters for a Phase get request
    class GetRequest < Tenk::Projects::GetRequest; end

    # The valid parameters for a Phase create request
    class CreateRequest < Tenk::Projects::CreateRequest
      property :phase_name
    end

    # The valid parameters for a Phase update request
    class UpdateRequest < Tenk::Projects::UpdateRequest
      property :phase_name
    end

    # List Phases for a single project
    # @param project_id [Integer] the id of the project
    # @param opts [Hash] the query parameters to add to list request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Projects::Phases::ListRequest
    def list(project_id, opts = {})
      super(project_id, ListRequest.new(opts))
    end

    # Get a single Assignment for this project
    # @param project_id [Integer] the id of the project
    # @param phase_id [Integer] the id of the phase
    # @param opts [Hash] the query parameters to add to the get request
    # @return [Hashie::Mash] the response as a Hashie::Mash
    # @see Tenk::Projects::Phases::GetRequest
    def get(project_id, phase_id, opts = {})
      super(project_id, phase_id, GetRequest.new(opts))
    end

    # Create a new Assignment for this project
    # @param project_id [Integer] the id of the project
    # @param opts [Hash] the post parameters to add to the create request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Projects::Phases::CreateRequest
    def create(project_id, opts = {})
      super(project_id, CreateRequest.new(opts))
    end

    # Update an Assignment for this project
    # @param project_id [Integer] the id of the project
    # @param phase_id [Integer] the id of the phase
    # @param opts [Hash] the post parameters to add to the create request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Projects::Phases::UpdateRequest
    def update(project_id, phase_id, opts = {})
      super(project_id, phase_id, UpdateRequest.new(opts))
    end
  end
end
