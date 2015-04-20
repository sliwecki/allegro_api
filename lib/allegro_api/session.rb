module AllegroApi
  class Session

    attr_accessor :user_id, :session_id

    def initialize(user_id, session_id)
      @user_id    = user_id
      @session_id = session_id
    end
  end
end
