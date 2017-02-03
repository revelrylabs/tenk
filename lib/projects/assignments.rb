require 'hashie'

require_relative './project_resource'

module Tenk
  # The API methods for Assignments which represent that a given user is
  # assigned to a project or phase
  class Projects::Assignments < ::Tenk::Projects::ProjectResource
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
      property :user_id
      property :starts_at
      property :ends_at
      property :percent
      property :fixed_hours
      property :hours_per_day
      property :allocation_mode
    end

    # The valid parameters for an Assignment update request
    class UpdateRequest < CreateRequest; end

    def list(project_id, opts = {})
      super(project_id, ListRequest.new(opts))
    end

    def get(project_id, assignment_id, opts = {})
      super(project_id, assignment_id, GetRequest.new(opts))
    end

    def create(project_id, opts = {})
      super(project_id, CreateRequest.new(opts))
    end

    def update(project_id, assignment_id, opts = {})
      super(project_id, assignment_id, UpdateRequest.new(opts))
    end

    def delete(project_id, assignment_id)
      super(project_id, assignment_id)
    end
  end
end
