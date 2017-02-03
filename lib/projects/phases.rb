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

    def list(project_id, opts = {})
      super(project_id, ListRequest.new(opts))
    end

    def get(project_id, phase_id, opts = {})
      super(project_id, phase_id, GetRequest.new(opts))
    end

    def create(project_id, opts = {})
      super(project_id, CreateRequest.new(opts))
    end

    def update(project_id, phase_id, opts = {})
      super(project_id, phase_id, UpdateRequest.new(opts))
    end
  end
end
