class AllegroApi
  class Error < StandardError

    attr_reader :error

    def initialize(error)
      @error = error.to_hash
    end

    def as_json
      result = case error[:fault][:faultcode]
      when 'ERR_INVALID_ACCESS_TOKEN', 'ERR_WEBAPI_KEY_INACTIVE', 'ERR_NO_SESSION', 'ERR_SESSION_EXPIRED', 'ERR_WEBAPI_EXPIRED',
        'ERR_USER_PASSWD', 'ERR_WEBAPI_KEY'
        { status: 401, error: :allegro_token_invalid }
      when 'ERR_INPUT_ARRAY_EMPTY', 'ERR_INPUT_ARRAY_OVERSIZED', 'ERR_SURCHARGES_ONLY', 'ERR_FILTER_DEPENDENCY_ALL',
        'ERR_FILTER_DEPENDENCY_AT_LEAST_ONE', 'ERR_FILTER_DEPENDENCY_MISMATCH', 'ERR_INCORRECT_FILTER_ID',
        'ERR_INCORRECT_FILTER_VALUE', 'ERR_INCORRECT_RESULT_SIZE', 'ERR_INCORRECT_RESULT_OFFSET', 'ERR_TOO_MANY_FILTER_VALUES'
        { status: 400, error: :validation_failed }
      else
        { status: 500, error: :internal_server_error }
      end
      result.merge!(message: message, details: details)
    end

    def message
      error[:fault][:faultstring]
    end

    def details
      error[:fault].slice(:faultcode, :faultactor)
    end
  end
end
