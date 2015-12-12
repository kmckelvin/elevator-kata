module Elevator
  module Instructions
    class Stop
      def eql?(other)
        other.is_a?(self.class)
      end
      alias_method :==, :eql?

      def next_step
        Actions::StopAction.new
      end
    end
  end
end
