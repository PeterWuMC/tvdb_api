module TvdbApi
  class Base
    attr_reader :raw

    def initialize(hash)
      @raw = hash
      mass_setter(hash)
    end

    def method_missing(method, *arguments, &block)
      if self.class::ATTRIBUTES_MAPPING.values.include?(method.to_s)
        update_missing_data if instance_variable_get("@#{method.to_s}").nil?
        instance_variable_get("@#{method.to_s}")
      else
        super
      end
    end

    private

    def mass_setter(serie_hash)
      @language = TvdbApi::Language.find_by_abbreviation(serie_hash.delete('language')) if serie_hash['language']

      self.class::ATTRIBUTES_MAPPING.each do |hash_key, attribute_name|
        instance_variable_set("@#{attribute_name}", serie_hash[hash_key]) if serie_hash[hash_key]
      end
    end

    def update_missing_data; end

  end
end
