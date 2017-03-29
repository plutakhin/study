module Plutakhin
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        ratios = films.map do |film|
          film['rating_kinopoisk'].to_f if !film['rating_kinopoisk'].to_f.zero? && !film['country'].nil? && film['country'].split(',').count > 1
        end . compact
        ratios.reduce(:+) / ratios.count
      end

      def chars_count(films, threshold)
        total = 0
        films.map do |film|
          total += film['name'].count('и') if film['rating_kinopoisk'].to_i >= threshold
        end
        total
      end
    end
  end
end
