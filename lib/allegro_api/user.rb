class AllegroApi
  module User

    #http://allegro.pl/webapi/documentation.php/show/id,84
    def get_my_data
      execute(:do_get_my_data, sessionHandle: session.key)
    end

    #http://allegro.pl/webapi/documentation.php/show/id,102
    def get_user_id
      execute(:do_get_user_id,
        countryId: configuration.country_code,
        userLogin: configuration.login,
        webapiKey: configuration.api_key
      )[:user_id]
    end

    #http://allegro.pl/webapi/documentation.php/show/id,104
    def get_user_login(user_id)
      execute(:do_get_user_login,
        countryId: configuration.country_code,
        userId: user_id,
        webapiKey: configuration.api_key
      )[:user_login]
    end

    #http://allegro.pl/webapi/documentation.php/show/id,341
    def show_user(user_id=nil)
      execute(:do_show_user,
        webapiKey: configuration.api_key,
        countryId: configuration.country_code,
        # userId: user_id,
        userLogin: configuration.login
      )
    end
  end
end
