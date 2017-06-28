module AllegroApi
  module SystemStatus

    #http://allegro.pl/webapi/documentation.php/show/id,62
    def query_all_sys_status
      execute(:do_query_all_sys_status,
        countryId: configuration.country_code,
        webapiKey: configuration.api_key
      )[:sys_country_status][:item]
    end

    #http://allegro.pl/webapi/documentation.php/show/id,61
    def query_sys_status(params)
      execute(:do_query_sys_status,
        sysvar: params,
        countryId: configuration.country_code,
        webapiKey: configuration.api_key
      )
    end
  end
end
