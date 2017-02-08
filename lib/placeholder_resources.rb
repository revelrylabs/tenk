require 'hashie'

module Tenk
  # API methods for PlaceholderResources, which are like Users, except they
  # don't represent a specific person, but rather a Placeholder on the schedule
  # for a certain kind of person / discipline
  class PlaceholderResources < ::Tenk::Resource
    # The valid parameters for a PlaceholderResources list request
    class ListRequest < ::Hashie::Trash
      property :fields, default: ''
      property :per_page, default: 20
      property :page, default: 1
    end

    # The valid parameters for a PlaceholderResources get request
    class GetRequest < ::Hashie::Trash
      property :fields, default: ''
    end

    # The valid parameters for a PlaceholderResources create request
    class CreateRequest < ::Hashie::Trash
      property :title
      property :role
      property :discipline
      property :location
    end

    # The valid parameters for a PlaceholderResources update request
    class UpdateRequest < CreateRequest
    end

    # FIXME: Can't test these on staging because Placeholders don't seem to
    #   be enabled on staging

    # def list(opts = {})
    #   super(ListRequest.new(opts))
    # end
    #
    # def get(id, opts = {})
    #   super(id, GetRequest.new(opts))
    # end
    #
    # def create(opts = {})
    #   super(CreateRequest.new(opts))
    # end
    #
    # def update(id, opts = {})
    #   super(id, UpdateRequest.new(opts))
    # end
  end
end
