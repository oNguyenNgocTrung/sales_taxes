require_relative "base"

module Categories
  class Medicine < Base
    class << self
      private

      def descriptors
        ["pills"]
      end
    end
  end
end
