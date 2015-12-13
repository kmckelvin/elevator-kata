module Elevator
  module Instructions
    class Stop
      def eql?(other)
        other.is_a?(self.class)
      end
      alias_method :==, :eql?

      def next_step(shaft_state)
        Actions::StopAction.new
      end

      def is_fulfilled?(shaft_state)
        shaft_state.elevator.stopped?
      end

      def absolute_distance(shaft_state)
        0
      end

      def directional_distance(shaft_state)
        0
      end
    end
  end
end
