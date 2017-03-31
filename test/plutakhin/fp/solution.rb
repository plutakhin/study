module Plutakhin
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        ratios = films.map do |film|
          ratio = film['rating_kinopoisk'].to_f
          country = film['country']
          ratio if !ratio.zero? && !country.nil? && country.split(',').count > 1
        end
        ratios.compact!
        ratios.reduce(:+) / ratios.count
      end

      def chars_count(films, threshold)
        films.inject(0) { |a, e| e['rating_kinopoisk'].to_i >= threshold ? a + e['name'].count('и') : a }
      end
    end
  end
end
