require 'base64'
require 'digest'
require 'savon'
require 'allegro_api/version'
require 'allegro_api/configuration'
require 'allegro_api/session'
require 'allegro_api/client'
require 'allegro_api/login'

module AllegroApi

  extend Client
  extend Login

  class << self

    attr_reader :session

    def configure
      yield(configuration) if block_given?
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
