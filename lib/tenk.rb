require_relative './client'

# An API wrapper gem for the 10k Plans API
module Tenk
  class << self
    # Make a new Tenk client
    def new(options = {}, &block)
      Client.new(options, &block)
    end
  end
end
