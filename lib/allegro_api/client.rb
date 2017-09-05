class AllegroApi
  module Client

    def execute(method, params)
      savon.call(method, message: params).body[:"#{method}_response"]
    rescue Savon::SOAPFault => error
      raise AllegroApi::Error.new(error)
    end

    private

    def savon
      @savon ||= Savon.client(
        wsdl: configuration.endpoint,
        log: configuration.log || false,
        pretty_print_xml: true
      )
    end
  end
end
