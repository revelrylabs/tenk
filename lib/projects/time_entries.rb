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

    def list(project_id, opts = {})
      super(project_id, ListRequest.new(opts))
    end

    def get(project_id, time_entry_id, opts = {})
      super(project_id, time_entry_id, GetRequest.new(opts))
    end

    def create(project_id, opts = {})
      super(project_id, CreateRequest.new(opts))
    end

    def update(project_id, time_entry_id, opts = {})
      super(project_id, time_entry_id, UpdateRequest.new(opts))
    end
  end
end
