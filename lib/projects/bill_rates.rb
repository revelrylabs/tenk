require 'hashie'

require_relative './project_resource'

module Tenk
  # The API methods for BillRate resources
  class Projects::BillRates < ::Tenk::Projects::ProjectResource
    class ListRequest < ::Tenk::BillRates::ListRequest; end
    class CreateRequest < ::Tenk::BillRates::CreateRequest; end
    class UpdateRequest < ::Tenk::BillRates::UpdateRequest; end

    def list(project_id, opts = {})
      super(project_id, ListRequest.new(opts))
    end

    def get(project_id, time_entry_id)
      super(project_id, time_entry_id, {})
    end

    def create(project_id, opts = {})
      super(project_id, CreateRequest.new(opts))
    end

    def update(project_id, time_entry_id, opts = {})
      super(project_id, time_entry_id, UpdateRequest.new(opts))
    end
  end
end
