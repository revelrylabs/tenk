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

    def list(user_id, opts = {})
      super(user_id, ListRequest.new(opts))
    end

    def get(user_id, time_entry_id, opts = {})
      super(user_id, time_entry_id, GetRequest.new(opts))
    end

    def create(user_id, opts = {})
      super(user_id, CreateRequest.new(opts))
    end

    def update(user_id, time_entry_id, opts = {})
      super(user_id, time_entry_id, UpdateRequest.new(opts))
    end
  end
end
