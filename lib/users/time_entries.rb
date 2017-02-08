require 'hashie'

require_relative './user_resource'

module Tenk
  # API methods for TimeEntries resources for a particular user
  class Users::TimeEntries < ::Tenk::Users::UserResource
    # Valid parameters for a list request of time entries of a user
    class ListRequest < ::Tenk::TimeEntries::ListRequest; end

    # Valid parameters for a get request of time entries of a user
    class GetRequest < ::Tenk::TimeEntries::GetRequest; end

    # Valid parameters for a create request of time entries of a user
    class CreateRequest < ::Tenk::TimeEntries::CreateRequest; end

    # Valid parameters for a update request of time entries of a user
    class UpdateRequest < ::Tenk::TimeEntries::UpdateRequest; end

    # List TimeEntries for a single user
    # @param user_id [Integer] the id of the user
    # @param opts [Hash] the query parameters to add to list request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Users::TimeEntries::ListRequest
    def list(user_id, opts = {})
      super(user_id, ListRequest.new(opts))
    end

    # Get a single TimeEntry for this user
    # @param user_id [Integer] the id of the user
    # @param time_entry_id [Integer] the id of the time entry
    # @param opts [Hash] the query parameters to add to the get request
    # @return [Hashie::Mash] the response as a Hashie::Mash
    # @see Tenk::Users::TimeEntries::GetRequest
    def get(user_id, time_entry_id, opts = {})
      super(user_id, time_entry_id, GetRequest.new(opts))
    end

    # Create a new TimeEntry for this user
    # @param user_id [Integer] the id of the user
    # @param opts [Hash] the post parameters to add to the create request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Users::TimeEntries::CreateRequest
    def create(user_id, opts = {})
      super(user_id, CreateRequest.new(opts))
    end

    # Update an TimeEntry for this user
    # @param user_id [Integer] the id of the user
    # @param time_entry_id [Integer] the id of the time entry
    # @param opts [Hash] the post parameters to add to the create request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Users::TimeEntries::UpdateRequest
    def update(user_id, time_entry_id, opts = {})
      super(user_id, time_entry_id, UpdateRequest.new(opts))
    end
  end
end
