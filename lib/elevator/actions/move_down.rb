module Elevator
  module Actions
    class MoveDown < AbstractMove
      private
      def target_floor(shaft_state)
        shaft_state.floor_navigator.floor_below(shaft_state.elevator.current_floor)
      end

      def target_direction
        :down
      end
    end
  end
end
