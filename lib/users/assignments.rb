require 'hashie'

require_relative './user_resource'

module Tenk
  # The API methods for Assignments, which record that a particular person is
  # assigned to a project or phase
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

    def list(user_id, opts = {})
      super(user_id, ListRequest.new(opts))
    end

    def get(user_id, assignment_id, opts = {})
      super(user_id, assignment_id, GetRequest.new(opts))
    end

    def create(user_id, opts = {})
      super(user_id, CreateRequest.new(opts))
    end

    def update(user_id, assignment_id, opts = {})
      super(user_id, assignment_id, UpdateRequest.new(opts))
    end

    def delete(user_id, assignment_id)
      super(user_id, assignment_id)
    end
  end
end
