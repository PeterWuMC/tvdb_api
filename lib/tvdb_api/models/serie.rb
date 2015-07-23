module TvdbApi
  class Serie

    ATTRIBUTES_MAPPING = {
      'seriesid'       => 'id',
      'language'       => 'language',
      'SeriesName'     => 'name',
      'banner'         => 'banner',
      'Overview'       => 'overview',
      'FirstAired'     => 'first_aired',
      'Network'        => 'network',
      # This come from series api
      'id'             => 'id',
      'SeriesID'       => 'id',
      'Actors'         => 'actors',
      'Airs_DayOfWeek' => 'airs_day_of_week',
      'Airs_Time'      => 'airs_time',
      'ContentRating'  => 'content_rating',
      'Genre'          => 'genre',
      'Rating'         => 'rating',
      'RatingCount'    => 'rating_count',
      'Runtime'        => 'runtime',
      'Status'         => 'status',
      'added'          => 'added',
      'addedBy'        => 'added_by',
      'lastupdated'    => 'last_updated',
      'fanart'         => 'fan_art',
      'poster'         => 'poster',
      'IMDB_ID'        => 'imdb_id',
      'NetworkID'      => 'network_id',
      'zap2it_id'      => 'zap2id_id',
    }

    class << self
      def find_by_name(name, language=nil)
        query = {}.tap do |query|
          query[:seriesname] = name
          query[:language]   = language.abbreviation if language.is_a?(TvdbApi::Language)
        end

        results = search(query)
        results = make_sure_results_is_array(results)

        if language.is_a?(TvdbApi::Language)
          results = results.select{ |serie_hash| serie_hash['language'] == language.abbreviation }
        end

        results.map do |serie_hash|
          new(serie_hash)
        end
      end

      def find_by_id(id, language=nil)
        url = "series/#{id}"
        url = "#{url}/#{language.abbreviation}.xml" if language.is_a?(TvdbApi::Language)
        new(TvdbApi::Client.get_with_token(url).to_h['Data']['Series'])
      end

      private

      def search(query)
        TvdbApi::Client.get('GetSeries.php', query: query).to_h['Data']['Series']
      end

      def make_sure_results_is_array(results)
        case results
        when Hash
          [results]
        when nil
          []
        else
          results
        end
      end
    end

    ATTRIBUTES_MAPPING.values.uniq.each do |attribute_name|
      define_method attribute_name do
        mass_setter(self.class.find_by_id(@id, @language).raw) if instance_variable_get("@#{attribute_name}").nil?
        instance_variable_get("@#{attribute_name}")
      end
    end

    attr_reader :raw

    def initialize(serie_hash)
      @raw = serie_hash

      mass_setter(serie_hash)
    end

    private
    def mass_setter(serie_hash)
      @language = TvdbApi::Language.find_by_abbreviation(serie_hash.delete('language')) if serie_hash['language']

      ATTRIBUTES_MAPPING.each do |hash_key, attribute_name|
        instance_variable_set("@#{attribute_name}", serie_hash[hash_key]) if serie_hash[hash_key]
      end

    end
  end
end
