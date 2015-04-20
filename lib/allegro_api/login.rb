module AllegroApi
  module Login

    def login_enc
      create_session(
        execute(:do_login_enc,
          userLogin:        configuration.login,
          userHashPassword: encode_password,
          countryCode:      configuration.country_code,
          webapiKey:        configuration.api_key,
          localVersion:     local_version
        )[:do_login_enc_response]
      )
    end

    def login
      create_session(
        execute(:do_login,
          userLogin:    configuration.login,
          userPassword: configuration.password,
          countryCode:  configuration.country_code,
          webapiKey:    configuration.api_key,
          localVersion: local_version
        )[:do_login_response]
      )
    end

    def create_session(response)
      @session = AllegroApi::Session.new(response[:user_id], response[:session_handle_part])
    end

    def encode_password
      Base64.strict_encode64(Digest::SHA256.new.digest(configuration.password))
    end

    def local_version
      system_statuses.each do |item|
        return item[:ver_key].to_i if item[:country_id].to_i == configuration.country_code
      end
    end

    def system_statuses
      execute(:do_query_all_sys_status,
        countryId: configuration.country_code,
        webapiKey: configuration.api_key
      )[:do_query_all_sys_status_response][:sys_country_status][:item]
    end
  end
end
