require "numa08_stalker/version"
require 'nokogiri'

module Numa08Stalker
  class Twilog
    def fetch
      ret = nil
      Net::HTTP.start 'twilog.org', 80 do |http|
        ret = http.get '/numa08/date-140823', 'User-Agent' => 'Chrome'
      end
      ret
    end

    def texts(body)
      doc = Nokogiri::HTML(body)
      doc.css('.tl-text').map(&:text)
    end
  end
end
