module Plutakhin
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        each do |elm|
          yield(elm)
        end
      end

      # Написать свою функцию my_map
      def my_map
        array = MyArray.new
        my_each do |elm|
          array << yield(elm)
        end
        array
      end

      # Написать свою функцию my_compact
      def my_compact
        array = MyArray.new
        my_each do |elm|
          array << elm unless elm.nil?
        end
        array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        if acc.nil?
          ignore_first = true
          acc = first
        end
        index = 0
        each do |elm|
          acc = yield(acc, elm) unless ignore_first && index == 0
          index += 1
        end
        acc
      end
    end
  end
end
