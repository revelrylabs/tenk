require 'hashie'

require_relative './project_resource'

module Tenk
  # API methods for TimeEntries of a project
  class Projects::TimeEntries < ::Tenk::Projects::ProjectResource
    # The valid parameters of a list TimeEntries of project request
    class ListRequest < ::Tenk::TimeEntries::ListRequest; end

    # The valid parameters of a get TimeEntries of project request
    class GetRequest < ::Tenk::TimeEntries::GetRequest; end

    # The valid parameters of a create TimeEntries of project request
    class CreateRequest < ::Tenk::TimeEntries::CreateRequest; end

    # The valid parameters of a update TimeEntries of project request
    class UpdateRequest < ::Tenk::TimeEntries::UpdateRequest; end

    # List TimeEntries for a single project
    # @param project_id [Integer] the id of the project
    # @param opts [Hash] the query parameters to add to list request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Projects::TimeEntries::ListRequest
    def list(project_id, opts = {})
      super(project_id, ListRequest.new(opts))
    end

    # Get a single Assignment for this project
    # @param project_id [Integer] the id of the project
    # @param time_entry_id [Integer] the id of the time entry
    # @param opts [Hash] the query parameters to add to the get request
    # @return [Hashie::Mash] the response as a Hashie::Mash
    # @see Tenk::Projects::TimeEntries::GetRequest
    def get(project_id, time_entry_id, opts = {})
      super(project_id, time_entry_id, GetRequest.new(opts))
    end

    # Create a new Assignment for this project
    # @param project_id [Integer] the id of the project
    # @param opts [Hash] the post parameters to add to the create request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Projects::TimeEntries::CreateRequest
    def create(project_id, opts = {})
      super(project_id, CreateRequest.new(opts))
    end

    # Update an Assignment for this project
    # @param project_id [Integer] the id of the project
    # @param time_entry_id [Integer] the id of the time entry
    # @param opts [Hash] the post parameters to add to the create request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Projects::TimeEntries::UpdateRequest
    def update(project_id, time_entry_id, opts = {})
      super(project_id, time_entry_id, UpdateRequest.new(opts))
    end
  end
end
