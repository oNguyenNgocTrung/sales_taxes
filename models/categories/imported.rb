require_relative "base"

module Categories
  class Imported < Base
    class << self
      private

      def descriptors
        ["imported"]
      end
    end
  end
end
