require 'hashie'

module Tenk
  # API actions for Approval resource which represents an approval of a time
  # entry or expense item
  class Approvals < ::Tenk::Resource
    # The valid parameters for an Approval list request
    class ListRequest < ::Hashie::Trash
      property :fields, default: ''
      property :per_page, default: 20
      property :page, default: 1
    end

    # The valid parameters for an Approval get request
    class GetRequest < ::Hashie::Trash
      property :fields, default: ''
    end

    # The valid parameters for an approval create request
    class CreateRequest < ::Hashie::Trash
      property :approvables
      property :status
    end

    # The valid parameters for an approval update request
    class UpdateRequest < CreateRequest
    end

    def list(opts = {})
      super(ListRequest.new(opts))
    end

    def get(id, opts = {})
      super(id, GetRequest.new(opts))
    end

    # FIXME: CREATE does not work due to the permissions of API users

    # def create(opts = {})
    #   @_client.logger.warn("Approvals currently cannot be created with API")
    #   @_client.post_with_body(resource_root, CreateRequest.new(opts))
    # end

    # FIXME: UPDATE does not work due to the permissions of API users

    # def update(id, opts = {})
    #   @_client.logger.warn("Approvals currently cannot be updated with API")
    #   super(id, UpdateRequest.new(opts))
    # end
  end
end
