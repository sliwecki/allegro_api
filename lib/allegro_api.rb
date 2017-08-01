require 'base64'
require 'digest'
require 'savon'
require 'allegro_api/version'
require 'allegro_api/configuration'
require 'allegro_api/client'
require 'allegro_api/session'
require 'allegro_api/system_status'
require 'allegro_api/authentication'
require 'allegro_api/user'
require 'allegro_api/contractor'

class AllegroApi
  extend Client
  include SystemStatus
  include Authentication
  include User
  include Contractor

  class << self
    def configure
      yield(configuration) if block_given?
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end

  delegate :configuration, :execute, to: :class
end
