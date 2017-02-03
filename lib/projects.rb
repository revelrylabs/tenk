require 'hashie'

module Tenk
  # API methods for Project resources
  class Projects < ::Tenk::Resource
    # Valid parameters for a project list request
    class ListRequest < ::Hashie::Trash
      property :from
      property :to
      property :fields, default: ''
      property :filter_field
      property :filter_list
      property :sort_field
      property :sort_order
      property :project_code
      property :phase_name
      property :with_archived, default: false
      property :with_phases, default: false
      property :per_page, default: 20
      property :page, default: 1
    end

    # Valid parameters for a project get request
    class GetRequest < ::Hashie::Trash
      property :fields, default: ''
    end

    # Valid parameters for a project create request
    class CreateRequest < ::Hashie::Trash
      property :name
      property :starts_at
      property :ends_at
      property :archived
      property :client
      property :description
      property :project_code
    end

    # Valid parameters for a project update request
    class UpdateRequest < CreateRequest
    end

    require_relative './projects/users'
    require_relative './projects/tags'
    require_relative './projects/phases'
    require_relative './projects/time_entries'
    require_relative './projects/assignments'
    require_relative './projects/bill_rates'

    def users
      @_users ||= Projects::Users.new(@_client)
    end

    def tags
      @_tags ||= Projects::Tags.new(@_client)
    end

    def phases
      @_phases ||= Projects::Phases.new(@_client)
    end

    def time_entries
      @_time_entries ||= Projects::TimeEntries.new(@_client)
    end

    def assignments
      @_assignments ||= Projects::Assignments.new(@_client)
    end

    def bill_rates
      @_bill_rates ||= Projects::BillRates.new(@_client)
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
