module AllegroApi
  module Client

    ENDPOINT = 'https://webapi.allegro.pl/service.php?wsdl'

    def execute(method, params)
      savon.call(method, message: params).body
    end

    def savon
      @savon ||= Savon.client(wsdl: ENDPOINT)
    end
  end
end
