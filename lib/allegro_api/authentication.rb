class AllegroApi
  module Authentication

    #http://allegro.pl/webapi/documentation.php/show/id,101582
    def login_with_access_token(params={})
      create_session(
        execute(:do_login_with_access_token,
          accessToken: params.fetch(:access_token) || 'ERR_INVALID_ACCESS_TOKEN', #HACK ERROR
          countryCode: params.fetch(:country_code, configuration.country_code),
          webapiKey: params.fetch(:api_key, configuration.api_key)
        )
      )
    end

    #http://allegro.pl/webapi/documentation.php/show/id,83
    def login_enc
      create_session(
        execute(:do_login_enc,
          userLogin:        configuration.login,
          userHashPassword: encode_password,
          countryCode:      configuration.country_code,
          webapiKey:        configuration.api_key,
          localVersion:     local_version
        )
      )
    end

    #http://allegro.pl/webapi/documentation.php/show/id,82
    def login
      create_session(
        execute(:do_login,
          userLogin:    configuration.login,
          userPassword: configuration.password,
          countryCode:  configuration.country_code,
          webapiKey:    configuration.api_key,
          localVersion: local_version
        )
      )
    end

    attr_reader :session

    private

    def create_session(response)
      @session = AllegroApi::Session.new(response[:user_id], response[:session_handle_part])
    end

    def encode_password
      Base64.strict_encode64(Digest::SHA256.new.digest(configuration.password))
    end

    def local_version
      [query_all_sys_status].flatten.select { |item| item[:country_id] == configuration.country_code.to_s }.first[:ver_key]
    end
  end
end
