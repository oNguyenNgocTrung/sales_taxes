require_relative "base"

module Categories
  class Book < Base
    class << self
      private

      def descriptors
        ["book"]
      end
    end
  end
end
