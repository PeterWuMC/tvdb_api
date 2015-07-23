module TvdbApi
  class Language
    class << self
      def all
        @languages ||= TvdbApi::Client.get_with_token('languages.xml').to_h['Languages']['Language']
      end

      def find_by_name(name)
        find_by('name', name)
      end

      def find_by_abbreviation(abbreviation)
        find_by('abbreviation', abbreviation)
      end

      def find_by_id(id)
        find_by('id', id)
      end

      private
      def find_by(key, value)
        new(all.detect {|language| language[key].to_s.downcase == value.to_s.downcase})
      end
    end

    attr_reader :name, :abbreviation, :id

    def initialize(language_hash)
      @name         = language_hash['name']
      @abbreviation = language_hash['abbreviation']
      @id           = language_hash['id']
    end
  end
end
