require "numa08_stalker/version"
require 'net/http'
require 'nokogiri'

module Numa08Stalker
  class Twilog
    def fetch
      ::Net::HTTP.start 'twilog.org', 80 do |http|
        http.get '/numa08/date-140823', 'User-Agent' => 'Chrome'
      end
    end

    def texts(body)
      doc = ::Nokogiri::HTML(body)
      doc.css('.tl-text').map(&:text)
    end
  end
end
