module Plutakhin
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map! { |a| a >= 0 ? max : a }
      end

      def search(array, query, from = 0, to = array.length)
        return -1 if from == to
        mid = (from + to) / 2
        value = array[mid]
        return mid if value == query

        if query < value
          to = mid
        else
          from = mid + 1
        end
        search(array, query, from, to)
      end
    end
  end
end
