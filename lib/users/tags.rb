module Tenk
  # API methods for listing, adding, and removing tags for users
  class Tags
    def initialize(client)
      @_client = client
    end

    def list(user_id)
      @_client.get("/users/#{user_id}/tags")
    end

    def add(user_id, tag)
      @_client.post("/users/#{user_id}/tags", value: tag)
    end

    def remove(user_id, tag_id)
      @_client.delete("/users/#{user_id}/tags/#{tag_id}")
    end
  end
end
