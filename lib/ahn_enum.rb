# ahn_enum.rb
# Copyright 2010 Verendus LLC
# Released under the terms of the LGPL, version 3
# http://www.gnu.org/licenses/lgpl.html
#
# This Adhearsion component looks for an ENUM reference from various possible
# backends, returning a VoIP URI if possible.  Nil is returned if no ENUM route
# is found.
# @author Ben Klang <bklang@verendus.com>

require 'net/http'
require 'uri'

class ENUMLookup

  class << self
    def query(number)
      backend = self.const_get(COMPONENTS.ahn_enum['backend'].to_sym)
      backend.query(number)
    end
  end

  class ENUMPlus
    URL = 'http://enumplus.org/api'

    class << self
      def query(number)
        options = {'key' => COMPONENTS.ahn_enum['ENUMPlus']['apikey']}
        res = Net::HTTP.post_form(URI.parse(URL + '/' + number), options).body
        return res if !res.empty?
        # res is empty? No result was found. Return nil.
        nil
      end
    end
  end
end

# Expose a method to Adhearsion's dialplan
methods_for :dialplan do
  def enum_lookup(number)
    ENUMLookup.query(number)
  end
end
