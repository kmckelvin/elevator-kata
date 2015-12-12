module Elevator
  module Instructions
    class Stop
      def eql?(other)
        other.is_a?(self.class)
      end
      alias_method :==, :eql?
    end
  end
end
