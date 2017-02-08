require 'hashie'

require_relative './user_resource'

module Tenk
  # The API methods for Assignments, which record that a particular person is
  # assigned to a user or phase
  class Users::Assignments < ::Tenk::Users::UserResource
    # The valid parameters for an Assignment list request
    class ListRequest < ::Hashie::Trash
      property :from
      property :to
      property :per_page
      property :page
    end

    # The valid parameters for an Assignment get request
    class GetRequest < ::Hashie::Trash; end

    # The valid parameters for an Assignment create request
    class CreateRequest < ::Hashie::Trash
      property :project_id
      property :assignable_id
      property :leave_type_id
      property :starts_at
      property :ends_at
      property :percent
      property :fixed_hours
      property :hours_per_day
      property :allocation_mode
    end

    # The valid parameters for an Assignment update request
    class UpdateRequest < CreateRequest; end

    # List Assignments for a single user
    # @param user_id [Integer] the id of the user
    # @param opts [Hash] the query parameters to add to list request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Users::Assignments::ListRequest
    def list(user_id, opts = {})
      super(user_id, ListRequest.new(opts))
    end

    # Get a single Assignment for this user
    # @param user_id [Integer] the id of the user
    # @param assignment_id [Integer] the id of the assignment
    # @param opts [Hash] the query parameters to add to the get request
    # @return [Hashie::Mash] the response as a Hashie::Mash
    # @see Tenk::Users::Assignments::GetRequest
    def get(user_id, assignment_id, opts = {})
      super(user_id, assignment_id, GetRequest.new(opts))
    end

    # Create a new Assignment for this user
    # @param user_id [Integer] the id of the user
    # @param opts [Hash] the post parameters to add to the create request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Users::Assignments::CreateRequest
    def create(user_id, opts = {})
      super(user_id, CreateRequest.new(opts))
    end

    # Update an Assignment for this user
    # @param user_id [Integer] the id of the user
    # @param assignment_id [Integer] the id of the assignment
    # @param opts [Hash] the post parameters to add to the create request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Users::Assignments::UpdateRequest
    def update(user_id, assignment_id, opts = {})
      super(user_id, assignment_id, UpdateRequest.new(opts))
    end

    # Delete an Assignment for this user
    # @param user_id [Integer] the id of the user
    # @param assignment_id [Integer] the id of the assignment
    # @return [bool] true if successful
    def delete(user_id, assignment_id)
      super(user_id, assignment_id)
    end
  end
end
