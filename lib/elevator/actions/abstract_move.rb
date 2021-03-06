module Elevator
  module Actions
    class AbstractMove
      def apply(shaft_state)
        next_floor = target_floor(shaft_state)

        if next_floor
          shaft_state.elevator.current_floor = next_floor
          shaft_state.elevator.motion = target_direction
          shaft_state.direction = target_direction
        end
      end

      private
      def target_floor(shaft_state)
        throw NotImplementedError, "Implement #{__method__} in subclasses of AbstractMove"
      end

      def target_direction
        throw NotImplementedError, "Implement #{__method__} in subclasses of AbstractMove"
      end
    end
  end
end
