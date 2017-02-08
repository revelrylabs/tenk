module Tenk
  # API methods for listing, adding, and removing tags for users
  class Tags
    # Initialize a Tenk::Users::Tag resource API wrapper for the given client
    def initialize(client)
      @_client = client
    end

    # List Tags for a single user
    # @param user_id [Integer] the id of the user
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    # @see Tenk::Users::Tags::ListRequest
    def list(user_id)
      @_client.get("/users/#{user_id}/tags")
    end

    # Attach a tag to a user
    # @param user_id [Integer] the id of the user
    # @param tag [String] the string of the tag to attach
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def add(user_id, tag)
      @_client.post("/users/#{user_id}/tags", value: tag)
    end

    # Remove a tag from a user
    # @param user_id [Integer] the id of the user
    # @param tag_id [Integer] the integer id of the tag
    # @return [Hashie::Mash] the API response as a Hashie::Mash
    def remove(user_id, tag_id)
      @_client.delete("/users/#{user_id}/tags/#{tag_id}")
    end
  end
end
