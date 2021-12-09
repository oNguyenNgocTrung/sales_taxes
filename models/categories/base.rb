module Categories
  class Base
    class << self
      def contains?(item_name)
        descriptors.any? { |descriptor| item_name.include?(descriptor) }
      end

      private

      def descriptors
        []
      end
    end
  end
end
