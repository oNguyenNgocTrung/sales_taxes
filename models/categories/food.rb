require_relative "base"

module Categories
  class Food < Base
    class << self
      private

      def descriptors
        ["chocolate", "cake", "candy"]
      end
    end
  end
end
