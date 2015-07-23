module TvdbApi
  class Serie
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

    attr_reader :seriesid, :language, :SeriesName, :banner, :Overview, :FirstAired, :Network, :id

    def initialize(serie_hash)
      @seriesid    = serie_hash['seriesid']
      @SeriesName  = serie_hash['SeriesName']
      @banner      = serie_hash['banner']
      @Overview    = serie_hash['Overview']
      @FirstAired  = serie_hash['FirstAired']
      @Network     = serie_hash['Network']
      @id          = serie_hash['id']

      @language    = TvdbApi::Language.find_by_abbreviation(serie_hash['language'])
    end
  end
end
