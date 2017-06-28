module AllegroApi
  class Session

    attr_accessor :user_id, :key

    def initialize(user_id, key)
      @user_id = user_id
      @key = key
    end
  end
end
