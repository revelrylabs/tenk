require 'hashie'

module Tenk
  # The API methods for obtaining and manipulating bill rats
  class BillRates < ::Tenk::Resource
    # The valid parameters for a BillRate list request
    class ListRequest < ::Hashie::Trash
      property :per_page, default: 20
      property :page, default: 1
    end

    # The valid parameters for a BillRate get request
    class GetRequest < ::Hashie::Trash; end

    # The valid parameters for a BillRate create request
    class CreateRequest < ::Hashie::Trash
      property :discipline_id
      property :role_id
      property :assignable_id
      property :user_id
      property :rate
      property :starts_at
      property :ends_at
      property :startdate
      property :enddate
    end

    # The valid paramters for a BillRate update request
    class UpdateRequest < CreateRequest; end

    # FIXME: LIST does not work due to permissions of API users

    # def list(opts = {})
    #   super(ListRequest.new(opts))
    # end

    # GET does not work due to permissions of API users

    # def get(id)
    #   super(id, {})
    # end

    # FIXME: CREATE does not work

    # def create(opts = {})
    #   super(CreateRequest.new(opts))
    # end

    # Update a BillRate for this 10k account
    # @param id [Integer] the id of the bill rate
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see UpdateRequest
    def update(id, opts = {})
      super(id, UpdateRequest.new(opts))
    end
  end
end
