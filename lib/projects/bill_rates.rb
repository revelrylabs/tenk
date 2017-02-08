require 'hashie'

require_relative './project_resource'

module Tenk
  # The API methods for BillRate resources
  class Projects::BillRates < ::Tenk::Projects::ProjectResource
    # The valid request parameters for listing BillRates
    class ListRequest < ::Tenk::BillRates::ListRequest; end
    # The valid request parameters for creating BillRates
    class CreateRequest < ::Tenk::BillRates::CreateRequest; end
    # The valid request parameters for updating BillRates
    class UpdateRequest < ::Tenk::BillRates::UpdateRequest; end

    # List BillRates for a single project
    # @param project_id [Integer] the id of the project
    # @param opts [Hash] the query parameters to add to list request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Projects::BillRates::ListRequest
    def list(project_id, opts = {})
      super(project_id, ListRequest.new(opts))
    end

    # Get a single BillRate for this project
    # @param project_id [Integer] the id of the project
    # @param bill_rate_id [Integer] the id of the bill_rate
    # @return [Hashie::Mash] the response as a Hashie::Mash
    # @see Tenk::Projects::BillRates::GetRequest
    def get(project_id, bill_rate_id)
      super(project_id, bill_rate_id, {})
    end

    # Create a new BillRate for this project
    # @param project_id [Integer] the id of the project
    # @param opts [Hash] the post parameters to add to the create request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Projects::BillRates::CreateRequest
    def create(project_id, opts = {})
      super(project_id, CreateRequest.new(opts))
    end

    # Update an BillRate for this project
    # @param project_id [Integer] the id of the project
    # @param bill_rate_id [Integer] the id of the bill_rate
    # @param opts [Hash] the post parameters to add to the create request
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Projects::BillRates::UpdateRequest
    def update(project_id, bill_rate_id, opts = {})
      super(project_id, bill_rate_id, UpdateRequest.new(opts))
    end
  end
end
