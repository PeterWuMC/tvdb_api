require 'httparty'

module TvdbApi
  class Client
    include HTTParty
    format :xml
    base_uri "http://www.thetvdb.com/api"

    class << self
      def set_token(token)
        @token = token
      end

      def mirrors
        get_with_token('mirrors.xml').to_h
      end

      def get_with_token(path, options={}, &block)
        get("#{@token}/#{path}", options, &block)
      end

      def get(path, options={}, &block)
        super("/#{path}", options, &block)
      end

      def token
        @token || raise("Please set your tvdb api token using #{self.name}.set_token=")
      end
    end

  end
end
