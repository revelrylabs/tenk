require 'hashie'

module Tenk
  # API methods for User resource which represents a single person (even if they
  # are not actually able to log in to 10k)
  class Users < ::Tenk::Resource
    # Valid parameters for a User list request
    class ListRequest < ::Hashie::Trash
      property :fields, default: ''
      property :per_page, default: 20
      property :page, default: 1
      property :with_archived, default: false
    end

    # Valid parameters for a User get request
    class GetRequest < ::Hashie::Trash
      property :fields, default: ''
    end

    # Valid parameters for a User create request
    class CreateRequest < ::Hashie::Trash
      property :email
      property :first_name
      property :last_name
      property :account_owner
      property :billable
      property :billability_target
      property :billrate
      property :discipline
      property :employee_number
      property :hire_date
      property :location
      property :mobile_phone
      property :office_phone
      property :role
      property :termination_date
    end

    # Valid parameters for a User update request
    class UpdateRequest < CreateRequest
      property :archived, default: false
    end

    require_relative './users/time_entries'
    require_relative './users/assignments'
    require_relative './users/tags'

    def time_entries
      @_time_entries ||= Users::TimeEntries.new(@_client)
    end

    def assignments
      @_assignments ||= Users::Assignments.new(@_client)
    end

    def tags
      @_tags ||= Tenk::Tags.new(@_client)
    end

    def list(opts = {})
      super(ListRequest.new(opts))
    end

    def get(id, opts = {})
      super(id, GetRequest.new(opts))
    end

    def create(opts = {})
      super(CreateRequest.new(opts))
    end

    def update(id, opts = {})
      super(id, UpdateRequest.new(opts))
    end
  end
end
